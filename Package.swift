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
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "BidMachine",
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/3.7.0/package/BidMachine.xcframework.zip",
            checksum: "f7a230661106cad3bc976a3dece62456bb6a0d351b94c1fb35561803473362e5"
        ),
        .binaryTarget(
            name: "OMSDK_Appodeal",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/external-sdks/OMSDK_Appodeal/1.6.0/SPM/OMSDK_Appodeal.zip",
            checksum: "0e952e40640f61bb2db2d4ef1a2bd741cbe7bd95534eb75fed2f70a70d04f800"
        ),
        .target(
            name: "BidMachineTarget",
            dependencies: [
                "BidMachine",
                "OMSDK_Appodeal"
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
