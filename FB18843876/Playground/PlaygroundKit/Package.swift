// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "PlaygroundKit",
    platforms: [.macOS(.v15), .iOS(.v18)],
    products: [
        .library(name: "PlaygroundKit", targets: [
            "PlaygroundKit"
        ])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest")
    ],
    targets: [
        .macro(
            name: "PlaygroundKitMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "PlaygroundKit", dependencies: ["PlaygroundKitMacros"])
    ]
)
