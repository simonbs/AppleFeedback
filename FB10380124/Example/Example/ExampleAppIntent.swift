//
//  ExampleAppIntent.swift
//  Example
//
//  Created by Simon Støvring on 20/06/2022.
//

import AppIntents

struct ExampleAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Example"
    static var description = IntentDescription("Runs an example shortcut.")

    static var parameterSummary: some ParameterSummary {
        Summary("Run Example")
    }

    @MainActor
    func perform() async throws -> some PerformResult {
        let outputIntenFile: IntentFile? = nil
        return .finished(value: outputIntenFile)
    }
}
