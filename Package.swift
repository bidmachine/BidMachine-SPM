// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BidMachine",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BidMachine",
            targets: ["BidMachineTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/bidmachine/OMSDK-Appodeal-iOS-Package", from: "1.6.3"),
    ],
    targets: [
        .binaryTarget(
            name: "BidMachine",
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/3.7.0/package/BidMachine.xcframework.zip",
            checksum: "f7a230661106cad3bc976a3dece62456bb6a0d351b94c1fb35561803473362e5"
        ),
        .target(
            name: "BidMachineTarget",
            dependencies: [
                "BidMachine",
                .product(name: "OMSDK_Appodeal", package: "OMSDK-Appodeal-iOS-Package")
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
