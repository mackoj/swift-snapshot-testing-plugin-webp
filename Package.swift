// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing-plugin-webp",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .macCatalyst(.v14)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "WEBPImageSerializer",
      targets: ["WEBPImageSerializer"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/awxkee/webp.swift.git", from: "1.1.1"),
    //    .package(path: "/Users/jeffreymacko/Developer/swift-snapshot-testing"),
    .package(url: "https://github.com/mackoj/swift-snapshot-testing.git", revision: "54c11f6"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "WEBPImageSerializer",
      dependencies: [
        .product(name: "webp", package: "webp.swift"),
        .product(name: "ImageSerializationPlugin", package: "swift-snapshot-testing"),
      ]
    ),
    .testTarget(
      name: "WEBPImageSerializerTests",
      dependencies: ["WEBPImageSerializer"]
    ),
  ]
)
