import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

public struct AppIntentGenerator {}

extension AppIntentGenerator: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        [
            try ExtensionDeclSyntax("extension \(type)") {
                """
                public struct ReturnFooAppIntent: AppIntent {
                    public static let isDiscoverable = true
                    public static let title = LocalizedStringResource("Return Foo")
                    public static let description = IntentDescription(
                        "Returns Foo as a string"
                    )
                    public static var parameterSummary: some ParameterSummary {
                        Summary("Return Foo")
                    }

                    public init() {}

                    public func perform() async throws -> some IntentResult & ReturnsValue<String> {
                         .result(value: "Foo")
                    }
                }
                """
            }
        ]
    }
}
