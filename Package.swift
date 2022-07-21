// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Apollo",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5)
  ],
  products: [
    .library(
      name: "NewApollo",
      targets: ["Apollo"]),
    .library(
      name: "NewApolloAPI",
      targets: ["ApolloAPI"]),
    .library(
      name: "NewApolloUtils",
      targets: ["ApolloUtils"]),
    .library(
      name: "NewApollo-Dynamic",
      type: .dynamic,
      targets: ["Apollo"]),
    .library(
      name: "NewApolloCodegenLib",
      targets: ["ApolloCodegenLib"]),
    .library(
      name: "NewApolloSQLite",
      targets: ["ApolloSQLite"]),
    .library(
      name: "NewApolloWebSocket",
      targets: ["ApolloWebSocket"]),
    .library(
      name: "NewApolloTestSupport",
      targets: ["ApolloTestSupport"]),
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
      name: "Apollo",
      dependencies: [
        "ApolloAPI",
        "ApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloAPI",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloUtils",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloCodegenLib",
      dependencies: [
        "ApolloUtils",
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
      name: "ApolloSQLite",
      dependencies: [
        "Apollo",
        .product(name: "SQLite", package: "SQLite.swift"),
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloWebSocket",
      dependencies: [
        "Apollo",
        "ApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloTestSupport",
      dependencies: ["ApolloAPI"],
      exclude: [
        "Info.plist"
      ]),
  ]
)
