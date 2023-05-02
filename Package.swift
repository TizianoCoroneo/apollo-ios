// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Apollo_Legacy",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5)
  ],
  products: [
    .library(
      name: "Apollo_Legacy",
      targets: ["Apollo_Legacy"]),
    .library(
      name: "ApolloAPI_Legacy",
      targets: ["ApolloAPI_Legacy"]),
    .library(
      name: "ApolloUtils_Legacy",
      targets: ["ApolloUtils_Legacy"]),
    .library(
      name: "Apollo-Dynamic_Legacy",
      type: .dynamic,
      targets: ["Apollo_Legacy"]),
    .library(
      name: "ApolloCodegenLib_Legacy",
      targets: ["ApolloCodegenLib_Legacy"]),
    .library(
      name: "ApolloSQLite_Legacy",
      targets: ["ApolloSQLite_Legacy"]),
    .library(
      name: "ApolloWebSocket_Legacy",
      targets: ["ApolloWebSocket_Legacy"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/stephencelis/SQLite.swift.git",
      .upToNextMinor(from: "0.13.1"))
  ],
  targets: [
    .target(
      name: "Apollo_Legacy",
      dependencies: [
        "ApolloAPI_Legacy",
        "ApolloUtils_Legacy"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloAPI_Legacy",
      dependencies: [],
      exclude: [
        "Info.plist",
        "CodegenV1"
      ]),
    .target(
      name: "ApolloUtils_Legacy",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloCodegenLib_Legacy",
      dependencies: [
        "ApolloUtils_Legacy",
      ],
      exclude: [
        "Info.plist",
        "Frontend/JavaScript",
      ],
      resources: [
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js"),
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js.map")
      ]),
    .target(
      name: "ApolloSQLite_Legacy",
      dependencies: [
        "Apollo_Legacy",
        .product(name: "SQLite", package: "SQLite.swift"),
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloWebSocket_Legacy",
      dependencies: [
        "Apollo_Legacy",
        "ApolloUtils_Legacy"
      ],
      exclude: [
        "Info.plist"
      ])
  ]
)
