//
//  ViewController.swift
//  HealthTest
//
//  Created by Simon Støvring on 15/07/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    private let healthButton: UIButton = {
        let this = UIButton(type: .system)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.setTitle("Read Health Data", for: .normal)
        return this
    }()
    private let activityIndicatorView: UIActivityIndicatorView = {
        let this = UIActivityIndicatorView(style: .medium)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.hidesWhenStopped = true
        return this
    }()
    private let messageLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textAlignment = .center
        this.font = .preferredFont(forTextStyle: .body)
        this.textColor = .label
        this.numberOfLines = 0
        this.isHidden = true
        return this
    }()
    private let stackView: UIStackView = {
        let this = UIStackView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.axis = .vertical
        this.spacing = 10
        return this
    }()
    private var timer: Timer?

    private let store = HKHealthStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        healthButton.addTarget(self, action: #selector(readHealthData), for: .touchUpInside)
        stackView.addArrangedSubview(healthButton)
        stackView.addArrangedSubview(activityIndicatorView)
        stackView.addArrangedSubview(messageLabel)
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

private extension ViewController {
    @objc private func readHealthData() {
        guard HKHealthStore.isHealthDataAvailable() else {
            showMessage("🚨 Health data is not available.")
            return
        }
        healthButton.isEnabled = false
        activityIndicatorView.startAnimating()
        let sampleType = HKSampleType.quantityType(forIdentifier: .dietaryCaffeine)!
        store.getRequestStatusForAuthorization(toShare: [], read: [sampleType]) { [weak self] status, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.didFailReading(with: error)
                } else {
                    switch status {
                    case .unnecessary:
                        self?.runQuery(sampleType: sampleType)
                    case .unknown:
                        self?.requestAuthorization(sampleType: sampleType)
                    case .shouldRequest:
                        self?.requestAuthorization(sampleType: sampleType)
                    @unknown default:
                        self?.requestAuthorization(sampleType: sampleType)
                    }
                }
            }
        }
    }

    private func requestAuthorization(sampleType: HKSampleType) {
        scheduleTimer()
        store.requestAuthorization(toShare: nil, read: [sampleType]) { [weak self] success, error in
            DispatchQueue.main.async {
                self?.clearTimer()
                if let error = error {
                    self?.didFailReading(with: error)
                } else if success {
                    self?.runQuery(sampleType: sampleType)
                } else {
                    self?.didFailReading(with: nil)
                }
            }
        }
    }

    private func runQuery(sampleType: HKSampleType) {
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 100, sortDescriptors: nil) { _, samples, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.didFailReading(with: error)
                } else {
                    self.didRead(samples ?? [])
                }
            }
        }
        store.execute(query)
    }

    private func didFailReading(with error: Error?) {
        activityIndicatorView.stopAnimating()
        if let error = error {
            showMessage("🚨 \(error.localizedDescription)")
        } else {
            showMessage("🚨 Unknown error")
        }
    }

    private func didRead(_ samples: [HKSample]) {
        activityIndicatorView.stopAnimating()
        showMessage("✅ Read \(samples.count) sample(s)")
    }

    private func showMessage(_ message: String) {
        print(message)
        messageLabel.text = message
        messageLabel.isHidden = false
    }

    private func scheduleTimer() {
        timer = .scheduledTimer(
            timeInterval: 5,
            target: self,
            selector: #selector(authorizationTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func clearTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func authorizationTimeout() {
        clearTimer()
        activityIndicatorView.stopAnimating()
        showMessage("🚨 Authorization should have happened at this point.")
    }
}
