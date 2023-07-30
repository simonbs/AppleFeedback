import Combine

final class SettingsStore {
    let useSystemBackgroundColor = CurrentValueSubject<Bool, Never>(true)
    let showMiddleLayer = CurrentValueSubject<Bool, Never>(true)
    let showVisualEffectView = CurrentValueSubject<Bool, Never>(true)
}
