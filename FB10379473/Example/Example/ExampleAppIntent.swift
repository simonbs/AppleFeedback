//
//  ExampleAppIntent.swift
//  Example
//
//  Created by Simon Støvring on 20/06/2022.
//

import AppIntents
import SwiftUI

struct ExampleAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Example"
    static var description = IntentDescription("Runs an example shortcut.")

    static var parameterSummary: some ParameterSummary {
        Summary("Run Example")
    }

    @MainActor
    func perform() async throws -> some PerformResult {
        return .finished {
            makeView(name: "Simon")
        }
    }
}

private extension ExampleAppIntent {
    @ViewBuilder private func makeView(name: String?) -> some View {
        if let name = name {
            Text("Hi \(name)!")
        } else {
            Text("Hi!")
        }
    }
}
