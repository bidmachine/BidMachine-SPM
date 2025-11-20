// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BidMachine",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BidMachine",
            targets: ["BidMachine", "BidMachineTarget"]
        )
    ],
    dependencies: [
        .package(
            name: "StackModules-SPM",
            url: "https://github.com/bidmachine/StackModules-SPM.git",
            from: "3.4.2-alpha.5"
        )
    ],
    targets: [
        .binaryTarget(
            name: "BidMachine",
            url: "https://bidmachine-ios.s3.amazonaws.com/BidMachine/3.5.1-alpha.0/spm/BidMachine.zip",
            checksum: "b96800cdfa47fb590093ced67627652201c16248ca84144cd0a22f921d7b6418"
        ),
        .target(
            name: "BidMachineTarget",
            dependencies: [
                .target(name: "BidMachine"),
                .product(name: "StackModules", package: "StackModules-SPM")
            ],
            path: "Sources/BidMachineTarget",
            sources: ["."]
        )
    ]
)
