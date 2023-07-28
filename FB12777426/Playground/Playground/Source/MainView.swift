import UIKit

final class MainView: UIView {
    private let textView: UITextView = {
        let this = UITextView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.isEditable = false
        this.isSelectable = false
        this.font = .systemFont(ofSize: 32, weight: .regular)
        this.text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae felis sit amet est ornare scelerisque eu at metus. Suspendisse rutrum est sed nulla scelerisque convallis. Vestibulum eu egestas nulla. Sed ut mi et tortor facilisis ultricies maximus sit amet lorem. Suspendisse tristique tempus mattis. Fusce ut gravida orci. Ut sagittis finibus lacinia. Pellentesque ullamcorper ipsum at leo mattis, vel laoreet mi gravida. Nullam vel laoreet felis, vel accumsan neque. Vivamus vitae quam porta, egestas felis id, blandit quam. In neque orci, bibendum vel tincidunt ac, volutpat at elit. Integer in imperdiet orci. Praesent sed orci turpis. Suspendisse fermentum, erat ut accumsan ultricies, quam augue viverra nibh, eget posuere ex dui quis turpis. Interdum et malesuada fames ac ante ipsum primis in faucibus.

Nulla facilisi. Aliquam blandit orci turpis, non molestie lacus ullamcorper placerat. Cras eleifend lacinia sapien ac tempus. Etiam ex turpis, rhoncus id odio sit amet, scelerisque tempus massa. In a diam quis elit ullamcorper pharetra a sit amet tellus. Etiam placerat vestibulum gravida. Quisque eget magna a magna malesuada euismod. Curabitur interdum, orci quis facilisis pretium, leo lectus bibendum dui, sit amet tincidunt ante eros et sapien. Sed lobortis sagittis sem, dictum sagittis urna auctor ut. Morbi ut vulputate odio. Morbi et lacus quis sem vulputate pretium vitae quis nisl. Mauris ac mattis libero, non tempor massa. Vivamus suscipit nulla non velit pretium, quis sollicitudin turpis interdum. Quisque eu est vel dui volutpat finibus non vitae tellus. Morbi mauris ante, vestibulum consequat scelerisque nec, auctor sed arcu.

Fusce consequat pharetra congue. Suspendisse ultrices ante non massa egestas interdum ac quis nulla. Phasellus condimentum pretium auctor. Fusce vitae convallis felis. Fusce placerat venenatis velit, id facilisis mauris venenatis convallis. Praesent mi augue, pretium et neque sit amet, tincidunt congue diam. Aenean sodales urna quis orci faucibus egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus.

Donec lacinia velit et mauris laoreet eleifend. Vestibulum pretium et purus egestas ullamcorper. Donec ipsum augue, pellentesque a pretium a, lacinia eget leo. Aliquam vestibulum quam in elementum varius. Aliquam semper imperdiet fermentum. Proin quis vulputate lectus. Nunc non ex erat. Nulla ultrices purus non tellus bibendum cursus. Vivamus feugiat quam quis metus tristique, eget pharetra ligula eleifend. Maecenas feugiat ante nec purus finibus pretium.

Cras quis ex nibh. Vestibulum tempor, mi sit amet luctus gravida, felis elit tristique lacus, ac viverra dolor nisi eget turpis. Fusce sagittis nunc nec felis venenatis scelerisque. Donec libero arcu, accumsan id tristique nec, scelerisque at nulla. Praesent augue neque, consectetur id nisl eu, mollis mollis lectus. Vivamus lectus tortor, malesuada a aliquet eu, consectetur eu enim. Etiam quis mollis libero, sed ornare tellus. Donec hendrerit maximus mauris, auctor ultricies nibh faucibus sed. Morbi pulvinar tristique ligula quis euismod. Cras ornare, eros non porttitor lacinia, ligula sem laoreet nisi, ut bibendum massa augue eget tellus.
"""
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
        addSubview(textView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
