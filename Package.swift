// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "AutoLayoutKit",
  platforms: [
    .iOS(.v9)
  ],
  products: [
    .library(name: "AutoLayoutKit", targets: ["AutoLayoutKit"])
  ],
  targets: [
    .target(name: "AutoLayoutKit")
  ]
)
