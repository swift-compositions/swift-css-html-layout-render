// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let cssHTMLLayoutRendering: Self = "CSS HTML Layout Rendering"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var cssHTMLLayoutRendering: Self { .target(name: .cssHTMLLayoutRendering) }
}

extension Target.Dependency {
    static var layout: Self {
        .product(name: "Layout", package: "swift-layout")
    }
    static var cssHTMLRendering: Self {
        .product(name: "CSS HTML Rendering", package: "swift-css-html-render")
    }
    static var cssStandard: Self {
        .product(name: "CSS Standard", package: "swift-css-standard")
    }
    static var htmlRendering: Self {
        .product(name: "HTML Rendering", package: "swift-html-render")
    }
    static var whatwgHTMLGrouping: Self {
        .product(name: "WHATWG HTML Grouping", package: "swift-whatwg-html")
    }
    static var sharedPrimitive: Self {
        .product(name: "Ownership Shared Primitive", package: "swift-ownership-shared")
    }
    static var hashIndexedPrimitive: Self {
        .product(name: "Hash Indexed Primitive", package: "swift-hash-table")
    }
    static var hashTablePrimitive: Self {
        .product(name: "Hash Table Primitive", package: "swift-hash-table")
    }

    static var bufferLinearPrimitive: Self {
        .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear")
    }
    static var dictionaryOrdered: Self {
        .product(
            name: "Dictionary Ordered",
            package: "swift-dictionary-ordered"
        )
    }
}

let package = Package(
    name: "swift-css-html-layout-render",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: .cssHTMLLayoutRendering, targets: [.cssHTMLLayoutRendering])
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-layout.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-compositions/swift-css-html-render.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-standards/swift-css-standard.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-html-render.git", branch: "main"),
        .package(url: "https://github.com/swift-whatwg/swift-whatwg-html.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-dictionary-ordered.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ownership-shared.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash-table.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-buffer-linear.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-atoms/swift-buffer.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-buffer-ring.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-memory.git", branch: "main", traits: ["Lock", "Map", "Shared", "Cursor"]),
        .package(url: "https://github.com/swift-molecules/swift-memory-allocation.git", branch: "main", traits: ["MemoryAllocatorArena", "MemoryInline", "MemorySmall"]),
        .package(url: "https://github.com/swift-atoms/swift-storage.git", branch: "main", traits: ["Generational", "Memory"]),
        .package(url: "https://github.com/swift-atoms/swift-store.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main", traits: ["Coder", "Parser", "Serializer"]),
        .package(url: "https://github.com/swift-atoms/swift-coder.git", branch: "main", traits: ["Carrier", "Map"]),
        .package(url: "https://github.com/swift-atoms/swift-ratio.git", branch: "main", traits: ["Bit", "Ordinal", "Difference"]),
        .package(url: "https://github.com/swift-atoms/swift-span.git", branch: "main", traits: ["Iterator", "Byte"]),
        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-point.git", branch: "main", traits: ["Affine", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-displacement.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-affine.git", branch: "main", traits: ["Tagged", "Vector"]),
        .package(url: "https://github.com/swift-atoms/swift-binary.git", branch: "main", traits: ["Serializer"]),
        .package(url: "https://github.com/swift-atoms/swift-collection.git", branch: "main", traits: ["Repetition", "Search"]),
        .package(url: "https://github.com/swift-atoms/swift-coordinate.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-cyclic.git", branch: "main", traits: ["Index", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-difference.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-formatter.git", branch: "main", traits: ["Conversions", "Number", "Radix", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-geometry.git", branch: "main", traits: ["Affine"]),
        .package(url: "https://github.com/swift-atoms/swift-iterator.git", branch: "main", traits: ["Repetition", "Search"]),
        .package(url: "https://github.com/swift-atoms/swift-parser.git", branch: "main", traits: ["Always", "Append", "Choice", "Either", "Iterator", "IteratorLeaves", "Map", "Optic", "Pair", "Predicate", "Product", "Repetition", "Skip"]),
        .package(url: "https://github.com/swift-atoms/swift-predicate.git", branch: "main", traits: ["Always"]),
        .package(url: "https://github.com/swift-atoms/swift-renderer.git", branch: "main", traits: ["Document"]),
        .package(url: "https://github.com/swift-atoms/swift-serializer.git", branch: "main", traits: ["Always", "Byte", "Either", "Map", "Optic", "Pair", "Repetition"]),
        .package(url: "https://github.com/swift-atoms/swift-text.git", branch: "main", traits: ["Byte", "Casing"]),
        .package(url: "https://github.com/swift-atoms/swift-time.git", branch: "main", traits: ["Affine"]),
        .package(url: "https://github.com/swift-atoms/swift-translation.git", branch: "main", traits: ["Affine"]),
    ],
    targets: [
        .target(
            name: .cssHTMLLayoutRendering,
            dependencies: [
                .layout,
                .cssHTMLRendering,
                .cssStandard,
                .htmlRendering,
                .whatwgHTMLGrouping,
                .dictionaryOrdered,
                .sharedPrimitive,
                .hashIndexedPrimitive,
                .hashTablePrimitive,
                .bufferLinearPrimitive,
                .product(name: "Buffer", package: "swift-buffer"),
                .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear"),
                .product(name: "Buffer Linear Bounded Primitive", package: "swift-buffer-linear"),
                .product(name: "Buffer Ring Primitive", package: "swift-buffer-ring"),
                .product(name: "Memory Allocator Pool", package: "swift-memory-allocation"),
                .product(name: "Memory Pool", package: "swift-memory-allocation"),
                .product(name: "Memory Allocator", package: "swift-memory-allocation"),
                .product(name: "Memory", package: "swift-memory"),
                .product(name: "Ownership Shared Primitive", package: "swift-ownership-shared"),
                .product(name: "Storage", package: "swift-storage"),
                .product(name: "Store", package: "swift-store"),
            ]
        ),
        .testTarget(
            name: .cssHTMLLayoutRendering.tests,
            dependencies: [
                .cssHTMLLayoutRendering
            ],
            path: "Tests/CSS HTML Layout Rendering Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
