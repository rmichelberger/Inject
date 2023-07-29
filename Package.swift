// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "Inject",
    platforms: [.macOS(.v10_14), .iOS(.v13), .tvOS(.v13), .watchOS(.v8)],
    products: [.library(name: "Inject", targets: ["Inject"]),],
    targets: [
        .target(name: "Inject"),
        .testTarget(
            name: "InjectTests",
            dependencies: ["Inject"]),
    ]
)
