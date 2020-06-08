// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "AutoLayoutKit",
  platforms: [
    .iOS(.v9)
  ],
  products: [
    .library(name: "AutoLayoutKit", targets: ["AutoLayoutKit"]),
  ],
  targets: [
    .target(name: "AutoLayoutKit", dependencies: [])
  ],
  swiftLanguageVersions: [.v5]
)
