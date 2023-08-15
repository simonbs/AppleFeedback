import UIKit

final class MainViewController: UIViewController {
    private let contentView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "InputAccessoryPlayground"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputAccessoryView()
        setupInputAssistantItem()
    }
}

private extension MainViewController {
    private func setupInputAccessoryView() {
        contentView.textView.inputAccessoryView = ExampleInputAccessoryView()
    }

    private func setupInputAssistantItem() {
        let leadingItem = UIBarButtonItem(title: "👋 Leading", style: .plain, target: nil, action: nil)
        let trailingItem = UIBarButtonItem(title: "👋 Trailing", style: .plain, target: nil, action: nil)
        let leadingItemGroup = UIBarButtonItemGroup(barButtonItems: [leadingItem], representativeItem: nil)
        let trailingItemGroup = UIBarButtonItemGroup(barButtonItems: [trailingItem], representativeItem: nil)
        let inputAssistantItem = contentView.textView.inputAssistantItem
        let defaultLeadingBarButtonItemGroups = inputAssistantItem.leadingBarButtonGroups
        let defaultTrailingBarButtonItemGroups = inputAssistantItem.trailingBarButtonGroups
        inputAssistantItem.leadingBarButtonGroups = defaultLeadingBarButtonItemGroups + [leadingItemGroup]
        inputAssistantItem.trailingBarButtonGroups = defaultTrailingBarButtonItemGroups + [trailingItemGroup]
    }
}
