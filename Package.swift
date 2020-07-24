// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Apollo",
  products: checkForLinux([
    .library(
      name: "Apollo",
      targets: ["Apollo"]),
    notOnLinux(.library(
      name: "ApolloCodegenLib",
      targets: ["ApolloCodegenLib"])),
    .library(
      name: "ApolloSQLite",
      targets: ["ApolloSQLite"]),
    notOnLinux(.library(
      name: "ApolloWebSocket",
      targets: ["ApolloWebSocket"])),
  ]),
  dependencies: checkForLinux([
    .package(
      url: "https://github.com/stephencelis/SQLite.swift.git",
      .exact("0.12.2")),
    .package(
      url: "https://github.com/daltoniam/Starscream",
      .exact("3.1.1")),
    linuxOnly(.package(
      url: "https://github.com/apple/swift-crypto",
      .exact("1.0.2")))
    ]),
  targets: checkForLinux([
    .target(
      name: "Apollo",
      dependencies: checkForLinux([
        linuxOnly("Crypto" as Target.Dependency)
      ])),
    notOnLinux(.target(
      name: "ApolloCodegenLib",
      dependencies: [])),
    .target(
      name: "ApolloSQLite",
      dependencies: ["Apollo", "SQLite"]),
    .target(
      name: "ApolloSQLiteTestSupport",
      dependencies: ["ApolloSQLite", "ApolloTestSupport"]),
    notOnLinux(.target(
      name: "ApolloWebSocket",
      dependencies: ["Apollo","Starscream"])),
    .target(
      name: "ApolloTestSupport",
      dependencies: ["Apollo"]),
    .target(
      name: "GitHubAPI",
      dependencies: ["Apollo"]),
    .target(
      name: "StarWarsAPI",
      dependencies: ["Apollo"]),
    
    .testTarget(
      name: "ApolloTests",
      dependencies: ["ApolloTestSupport", "StarWarsAPI"]),
    .testTarget(
      name: "ApolloCacheDependentTests",
      dependencies: ["ApolloSQLiteTestSupport", "StarWarsAPI"]),
    notOnLinux(.testTarget(
      name: "ApolloCodegenTests",
      dependencies: ["ApolloCodegenLib"])),
    .testTarget(
      name: "ApolloSQLiteTests",
      dependencies: ["ApolloSQLiteTestSupport", "StarWarsAPI"]),
    notOnLinux(.testTarget(
      name: "ApolloWebsocketTests",
      dependencies: ["ApolloWebSocket", "ApolloTestSupport", "StarWarsAPI"])),
    ])
)

func checkForLinux<T>(_ values: [T?]) -> [T] {
  values.compactMap { $0 }
}

func linuxOnly<T>(_ value: T) -> T? {
  #if os(Linux)
  return value
  #else
  return nil
  #endif
}

func notOnLinux<T>(_ value: T) -> T? {
  #if os(Linux)
  return nil
  #else
  return value
  #endif
}
