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
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/3.8.2/package/BidMachine.xcframework.zip",
            checksum: "d52a6776948b4da4250bf23045021d317efe1d8ccdc122c22438df8924e9a4e5"
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
