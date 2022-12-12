// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "algo-api",
    products: [
        .executable(name: "algo-api", targets: ["algo-api"]),
        .library(name: "App", targets: ["App"]),
        .library(name: "Algo", targets: ["Algo"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
         .package(url: "https://github.com/Kitura/HeliumLogger.git", exact: "1.9.200"),
         .package(url: "https://github.com/Kitura/Kitura.git", exact: "2.9.200"),
         .package(url: "https://github.com/Kitura/Kitura-CORS.git", exact: "2.1.201"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "algo-api",
            dependencies: ["App", "Algo", "HeliumLogger", "Kitura",
                           .product(name: "KituraCORS", package: "Kitura-CORS")]
        ),
        .target(name: "App", dependencies: ["Algo"]),
        .target(name: "Algo"),
//        .testTarget(
//            name: "prime-apiTests",
//            dependencies: ["algo-api"]),
    ]
)
