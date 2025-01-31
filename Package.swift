// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "LingoVapor",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "LingoVapor", targets: ["LingoVapor"]),
        .library(name: "LingoVaporLeaf", targets: ["LingoVaporLeaf"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.27.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/werm098/Lingo.git", branch: "develop"),
    ],
    targets: [
        .target(name: "LingoVapor", dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Lingo", package: "Lingo")
        ]),
        .target(name: "LingoVaporLeaf", dependencies: [
            .target(name: "LingoVapor"),
            .product(name: "Leaf", package: "leaf")
        ]),
        .testTarget(name: "LingoVaporTests", dependencies: [
            .target(name: "LingoVapor")
        ])
    ]
)
