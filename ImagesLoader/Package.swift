// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ImagesLoader",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ImagesLoader",
            targets: ["ImagesLoader"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ImagesLoader",
            dependencies: []
        ),
    ]
)
