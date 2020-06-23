//
//  MainViewController.swift
//  ShortcutBookmarks
//
//  Created by Simon Støvring on 31/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit
import ShortcutBookmarksKit
import MobileCoreServices

final class MainViewController: UIViewController {
    private let contentView = MainView()
    private let bookmarkStore = BookmarkStore()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Shortcut Bookmarks"
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.bookmarkButton.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        refreshBookmark()
    }
}

private extension MainViewController {
    @objc private func addBookmark() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.sourceView = contentView.bookmarkButton.superview
        alertController.popoverPresentationController?.sourceRect = contentView.bookmarkButton.frame
        alertController.addAction(UIAlertAction(title: "Bookmark Folder", style: .default, handler: { [weak self] _ in
            self?.bookmarkFolder()
        }))
        alertController.addAction(UIAlertAction(title: "Bookmark File", style: .default, handler: { [weak self] _ in
            self?.bookmarkFile()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }

    private func bookmarkFolder() {
        let documentPickerViewController = UIDocumentPickerViewController(
            documentTypes: [kUTTypeFolder as String],
            in: .open)
        documentPickerViewController.delegate = self
        documentPickerViewController.allowsMultipleSelection = true
        present(documentPickerViewController, animated: true)
    }

    private func bookmarkFile() {
        let documentPickerViewController = UIDocumentPickerViewController(
            documentTypes: [kUTTypeItem as String],
            in: .open)
        documentPickerViewController.delegate = self
        documentPickerViewController.allowsMultipleSelection = true
        present(documentPickerViewController, animated: true)
    }

    private func refreshBookmark() {
        if bookmarkStore.containsBookmark {
            let bookmarkResult = bookmarkStore.resolveBookmark()
            switch bookmarkResult {
            case .success(let bookmark):
                let filename = bookmark.localizedFilename ?? bookmark.filename ?? "Unknown Filename"
                if bookmark.isDirectory {
                    setBookmarkTitle(filename, image: UIImage(systemName: "folder"))
                } else {
                    setBookmarkTitle(filename, image: UIImage(systemName: "doc"))
                }
            case .failure(let error):
                setBookmarkTitle("Add Bookmark", image: nil)
                showErrorMessage(error.localizedDescription)
            }
        } else {
            setBookmarkTitle("Add Bookmark", image: nil)
        }
    }

    private func setBookmarkTitle(_ title: String, image: UIImage?) {
        UIView.performWithoutAnimation {
            contentView.bookmarkButton.setTitle(title, for: .normal)
            contentView.bookmarkButton.setImage(image, for: .normal)
            contentView.bookmarkButton.layoutIfNeeded()
        }
    }

    private func showErrorMessage(_ message: String) {
        contentView.errorLabel.text = message
        contentView.errorLabel.isHidden = false
    }

    @objc private func applicationDidBecomeActive() {
        refreshBookmark()
    }
}

extension MainViewController: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            controller.dismiss(animated: true)
            return
        }
        do {
            try bookmarkStore.bookmark(url)
            refreshBookmark()
            contentView.errorLabel.isHidden = true
        } catch {
            showErrorMessage(error.localizedDescription)
        }
        controller.dismiss(animated: true)
    }
}
