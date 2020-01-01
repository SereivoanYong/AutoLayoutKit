// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AutoLayoutKit",
  platforms: [.iOS(.v9)],
  products: [
    .library(name: "AutoLayoutKit", targets: ["AutoLayoutKit"]),
  ],
  targets: [
    .target(name: "AutoLayoutKit", dependencies: [])
  ],
  swiftLanguageVersions: [.v5]
)
