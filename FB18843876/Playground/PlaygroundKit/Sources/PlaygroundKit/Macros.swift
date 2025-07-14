@attached(extension, names: arbitrary)
macro AppIntentGenerator() = #externalMacro(
    module: "PlaygroundKitMacros",
    type: "AppIntentGenerator"
)
