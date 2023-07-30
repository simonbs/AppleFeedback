import UIKit

final class ExampleView: UIView {
    private let middleLayerView: UIImageView = {
        let this = UIImageView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.image = UIImage(named: "MiddleLayer")
        this.contentMode = .scaleAspectFill
        return this
    }()
    private let visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .regular)
        let this = UIVisualEffectView(effect: effect)
        this.translatesAutoresizingMaskIntoConstraints = false
        return this
    }()
    private let noticeLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.text = "This is a UIVisualEffectView with a blur effect."
        this.textAlignment = .center
        this.font = .systemFont(ofSize: 32, weight: .bold)
        this.numberOfLines = 0
        return this
    }()

    private let useSystemBackgroundColor: Bool

    init(useSystemBackgroundColor: Bool, showMiddleLayer: Bool, showVisualEffectView: Bool) {
        self.useSystemBackgroundColor = useSystemBackgroundColor
        middleLayerView.isHidden = !showMiddleLayer
        visualEffectView.isHidden = !showVisualEffectView
        noticeLabel.isHidden = !showVisualEffectView
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = useSystemBackgroundColor ? .systemBackground : .black
        addSubview(middleLayerView)
        addSubview(visualEffectView)
        addSubview(noticeLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            middleLayerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleLayerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleLayerView.topAnchor.constraint(equalTo: topAnchor),
            middleLayerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            visualEffectView.centerXAnchor.constraint(equalTo: centerXAnchor),
            visualEffectView.centerYAnchor.constraint(equalTo: centerYAnchor),
            visualEffectView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
            visualEffectView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),

            noticeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: visualEffectView.leadingAnchor),
            noticeLabel.trailingAnchor.constraint(lessThanOrEqualTo: visualEffectView.trailingAnchor),
            noticeLabel.topAnchor.constraint(greaterThanOrEqualTo: visualEffectView.topAnchor),
            noticeLabel.bottomAnchor.constraint(lessThanOrEqualTo: visualEffectView.bottomAnchor),
            noticeLabel.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
            noticeLabel.centerYAnchor.constraint(equalTo: visualEffectView.centerYAnchor)
        ])
    }

    func addSettingsView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
    }
}
