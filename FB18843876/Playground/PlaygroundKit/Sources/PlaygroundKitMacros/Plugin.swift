import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct PlaygroundKitPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        AppIntentGenerator.self
    ]
}
