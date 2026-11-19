// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "BidMachine",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BidMachine",
            targets: ["BidMachineTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/bidmachine/OMSDK-Bidmachine-iOS-Package", exact: "1.6.11"),
    ],
    targets: [
        .binaryTarget(
            name: "BidMachine",
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/4.0.0/package/BidMachine.xcframework.zip",
            checksum: "e2a6cb3b2ada5529acb7f8f45e8d892a66c98cfb80a84143d60c6cd811d63a4b"
        ),
        .target(
            name: "BidMachineTarget",
            dependencies: [
                "BidMachine",
                .product(name: "OMSDK_Bidmachine", package: "OMSDK-Bidmachine-iOS-Package")
            ],
            path: "Sources/BidMachineTarget",
            sources: ["."],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("AVKit"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("ImageIO"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("SafariServices"),
                .linkedFramework("Security"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedFramework("AppTrackingTransparency", .when(platforms: [.iOS])),
                .linkedLibrary("z", .when(platforms: [.iOS])),
                .linkedLibrary("sqlite3", .when(platforms: [.iOS])),
                .linkedLibrary("xml2", .when(platforms: [.iOS]))
            ]
        )
    ]
)
