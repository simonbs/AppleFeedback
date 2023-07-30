import SwiftUI

struct SettingsView: View {
    @State private var useSystemBackgroundColor: Bool
    @State private var showMiddleLayer: Bool
    @State private var showVisualEffectView: Bool

    private let settingsStore: SettingsStore

    init(settingsStore: SettingsStore) {
        self.settingsStore = settingsStore
        _useSystemBackgroundColor = State(initialValue: settingsStore.useSystemBackgroundColor.value)
        _showMiddleLayer = State(initialValue: settingsStore.showMiddleLayer.value)
        _showVisualEffectView = State(initialValue: settingsStore.showVisualEffectView.value)
    }

    var body: some View {
        HStack {
            Spacer()
            SettingView(
                title: "Use System Background Color",
                isEnabled: $useSystemBackgroundColor
            )
            Spacer()
            SettingView(
                title: "Show Photo",
                isEnabled: $showMiddleLayer
            )
            Spacer()
            SettingView(
                title: "Show Visual Effect View",
                isEnabled: $showVisualEffectView
            )
            Spacer()
        }
        .padding()
        .background {
            LinearGradient(colors: [.black.opacity(0), .black.opacity(0.6)], startPoint: .top, endPoint: .center)
        }
        .onReceive(settingsStore.useSystemBackgroundColor) { useSystemBackgroundColor in
            self.useSystemBackgroundColor = useSystemBackgroundColor
        }
        .onReceive(settingsStore.showMiddleLayer) { showMiddleLayer in
            self.showMiddleLayer = showMiddleLayer
        }
        .onReceive(settingsStore.showVisualEffectView) { showVisualEffectView in
            self.showVisualEffectView = showVisualEffectView
        }
        .onChange(of: useSystemBackgroundColor) { _, useSystemBackgroundColor in
            settingsStore.useSystemBackgroundColor.value = useSystemBackgroundColor
        }
        .onChange(of: showMiddleLayer) { _, showMiddleLayer in
            settingsStore.showMiddleLayer.value = showMiddleLayer
        }
        .onChange(of: showVisualEffectView) { _, showVisualEffectView in
            settingsStore.showVisualEffectView.value = showVisualEffectView
        }
    }
}

private struct SettingView: View {
    let title: String
    let isEnabled: Binding<Bool>

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 24, weight: .bold))
            Toggle(isOn: isEnabled) {
                Text(title)
            }
            .labelsHidden()
        }
    }
}
