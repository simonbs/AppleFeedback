import UIKit

final class MainView: UIView {
    private let toolTipButton: UIButton = {
        var configuration: UIButton.Configuration = .plain()
        configuration.title = "I'm a UIButton with a tooltip but I won't show it 🙅‍♂️"
        let this = UIButton(configuration: configuration)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.toolTip = "This is my tooltip!"
        return this
    }()
    private let toolTipInteractionLabel: UIView = {
        let this = UILabel()
        this.text = "I'm a UILabel with a UIToolTipInteraction but I won't show it 🙅‍♂️"
        let tooltipInteraction = UIToolTipInteraction(defaultToolTip: "This is my tooltip!")
        this.addInteraction(tooltipInteraction)
        return this
    }()
    let stackView: UIStackView = {
        let this = UIStackView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.axis = .vertical
        return this
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        stackView.spacing = 44
        stackView.addArrangedSubview(toolTipButton)
        stackView.addArrangedSubview(toolTipInteractionLabel)
        addSubview(stackView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
