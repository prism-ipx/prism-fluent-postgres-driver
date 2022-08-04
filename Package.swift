// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "fluent-postgres-driver",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "FluentPostgresDriver", targets: ["FluentPostgresDriver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/async-kit.git", from: "1.2.0"),
        .package(url: "https://github.com/prism-ipx/prism-fluent-kit.git", from: "1.0.0"),
        .package(url: "https://github.com/prism-ipx/prism-postgres-kit.git", branch: "2.3.0bq"),
    ],
    targets: [
        .target(name: "FluentPostgresDriver", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "FluentKit", package: "prism-fluent-kit"),
            .product(name: "FluentSQL", package: "prism-fluent-kit"),
            .product(name: "PostgresKit", package: "prism-postgres-kit"),
        ]),
        .testTarget(name: "FluentPostgresDriverTests", dependencies: [
            .product(name: "FluentBenchmark", package: "prism-fluent-kit"),
            .target(name: "FluentPostgresDriver"),
        ]),
    ]
)
