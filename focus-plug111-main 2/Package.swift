// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FocusPlug",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "FocusPlug",
            targets: ["FocusPlug"]
        )
    ],
    dependencies: [
        // Add any external dependencies here if needed
    ],
    targets: [
        .executableTarget(
            name: "FocusPlug",
            dependencies: [],
            path: "Sources"
        )
    ]
)