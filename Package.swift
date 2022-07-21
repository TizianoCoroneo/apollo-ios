// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NewApollo",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5)
  ],
  products: [
    .library(
      name: "NewApollo",
      targets: ["NewApollo"]),
    .library(
      name: "NewApolloAPI",
      targets: ["NewApolloAPI"]),
    .library(
      name: "NewApolloUtils",
      targets: ["NewApolloUtils"]),
    .library(
      name: "NewApollo-Dynamic",
      type: .dynamic,
      targets: ["NewApollo"]),
    .library(
      name: "NewApolloCodegenLib",
      targets: ["NewApolloCodegenLib"]),
    .library(
      name: "NewApolloSQLite",
      targets: ["NewApolloSQLite"]),
    .library(
      name: "NewApolloWebSocket",
      targets: ["NewApolloWebSocket"]),
    .library(
      name: "NewApolloTestSupport",
      targets: ["NewApolloTestSupport"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/stephencelis/SQLite.swift.git",
        .upToNextMinor(from: "0.13.1")),
    .package(
      url: "https://github.com/mattt/InflectorKit",
      .upToNextMinor(from: "1.0.0")),
    .package(
      url: "https://github.com/apple/swift-collections",
      .upToNextMajor(from: "1.0.0"))
  ],
  targets: [
    .target(
      name: "NewApollo",
      dependencies: [
        "NewApolloAPI",
        "NewApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "NewApolloAPI",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "NewApolloUtils",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "NewApolloCodegenLib",
      dependencies: [
        "NewApolloUtils",
        .product(name: "InflectorKit", package: "InflectorKit"),
        .product(name: "OrderedCollections", package: "swift-collections")
      ],
      exclude: [
        "Info.plist",
        "Frontend/JavaScript",
      ],
      resources: [
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js"),
      ]),
    .target(
      name: "NewApolloSQLite",
      dependencies: [
        "NewApollo",
        .product(name: "SQLite", package: "SQLite.swift"),
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "NewApolloWebSocket",
      dependencies: [
        "NewApollo",
        "NewApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "NewApolloTestSupport",
      dependencies: ["NewApolloAPI"],
      exclude: [
        "Info.plist"
      ]),
  ]
)
