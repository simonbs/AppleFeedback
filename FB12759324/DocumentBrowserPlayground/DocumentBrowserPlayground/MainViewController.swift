import UIKit

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(done)
        )
    }

    @objc private func done() {
        dismiss(animated: true)
    }
}
