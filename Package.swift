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
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/3.5.1-alpha.0/spm/BidMachine.zip",
            checksum: "b96800cdfa47fb590093ced67627652201c16248ca84144cd0a22f921d7b6418"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://bidmachine-ios.s3.amazonaws.com/StackModules/3.4.2/spm/StackModules.zip",
            checksum: "6dcd34d8d4cd81aebf4eb406083e3e4e48c39c4584b94504947d26db991470cd"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://bidmachine-ios.s3.amazonaws.com/StackModules/3.4.2/spm/StackProductPresentation.zip",
            checksum: "380e279e92fe43892ea9b94389d57e4c90ac14eff6d5c707b454b6d828bff071"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://bidmachine-ios.s3.amazonaws.com/StackModules/3.4.2/spm/StackRendering.zip",
            checksum: "87ee4eba272677f9df2be129106b9fa156a48e8a482063112677e85591ee5127"
        ),
        .binaryTarget(
            name: "OMSDK_Appodeal",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/external-sdks/OMSDK_Appodeal/1.6.0/SPM/OMSDK_Appodeal.zip",
            checksum: "ee366dd03c3a4b3bbee7afa443e7539951c1e8c213403048ba008f02f0fb0eb6"
        ),
        .target(
            name: "BidMachineTarget",
            dependencies: [
                "BidMachine",
                "StackModules",
                "StackProductPresentation",
                "StackRendering",
                "OMSDK_Appodeal"
            ],
            path: "Sources/BidMachineTarget",
            sources: ["."],
            linkerSettings: [
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("WebKit"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("AdSupport"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("UIKit"),
                .linkedFramework("ImageIO"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("UniformTypeIdentifiers", .when(platforms: [.iOS])),
                .linkedLibrary("z", .when(platforms: [.iOS]))
            ]
        )
    ]
)
