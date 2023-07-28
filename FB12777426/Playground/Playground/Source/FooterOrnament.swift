import SwiftUI

struct FooterOrnamentView: View {
    let viewModel: FooterOrnamentViewModel

    var body: some View {
        Text(viewModel.text)
            .multilineTextAlignment(.center)
            .padding()
            .fixedSize(horizontal: true, vertical: true)
            .glassBackgroundEffect()
    }
}

