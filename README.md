# Clockmoji

Simple time formatting using clock emojis.

## Installation

### Compatibility

- Platforms:
    - macOS 10.9+
    - iOS 8.0+
    - watchOS 2.0+
    - tvOS 9.0+
    - Linux
- Xcode 7.3 and 8.0 beta 6
- Swift 2.2 and 3.0 preview 6

### Install Using Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a
decentralized dependency manager for Swift.

1. Add the project to your `Package.swift`.

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeProject",
        dependencies: [
            .Package(url: "https://github.com/nvzqz/Clockmoji.git",
                     majorVersion: 1)
        ]
    )
    ```

2. Import the Clockmoji module.

    ```swift
    import Clockmoji
    ```

### Install Using CocoaPods
[CocoaPods](https://cocoapods.org/) is a centralized dependency manager for
Objective-C and Swift. Go [here](https://guides.cocoapods.org/using/index.html)
to learn more.

1. Add the project to your [Podfile](https://guides.cocoapods.org/using/the-podfile.html).

    ```ruby
    use_frameworks!

    pod 'Clockmoji', '~> 1.0.0'
    ```

    If you want to be on the bleeding edge, replace the last line with:

    ```ruby
    pod 'Clockmoji', :git => 'https://github.com/nvzqz/Clockmoji.git'
    ```

2. Run `pod install` and open the `.xcworkspace` file to launch Xcode.

3. Import the Clockmoji framework.

    ```swift
    import Clockmoji
    ```

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "nvzqz/Clockmoji"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add Clockmoji to your project.

3. Import the Clockmoji framework.

    ```swift
    import Clockmoji
    ```

### Install Manually

Simply add the contents of the `Sources` folder into your project.

## Usage

The `ClockFace` enum features twenty-four cases for each clock emoji available.

A `ClockFace` can be created from a time.

```swift
let tenOClock = ClockFace(time: 10)
let sixThirty = ClockFace(time: 6.5)

/// Rounds down in .5 intervals
let twoSomething = ClockFace(time: 2.4)  // two: 🕑

/// Works with negatives
let twoOClock = ClockFace(time: -10)  // equal to twoSomething

/// Works with large numbers
let crazyFace = ClockFace(time: 42352345432)  // four: 🕓
```

`ClockFace` can be initialized from a `Date`.

```swift
let noon: Date = ...
let face = ClockFace(date: noon)  // 🕛
```

A `ClockFace` can also be created from the current date if no date is specified.

```swift
let face = ClockFace()  // 🕥
```

`ClockFace` conforms to `Strideable`, allowing it to be used within a countable
range.

```swift
for face in ClockFace.one...ClockFace.three {
    ...
}
```

The `advanced(by:)` method circles through faces in either a positive or negative direction.

```swift
ClockFace.two.advanced(by: 4) == ClockFace.two.advanced(by: 28)
ClockFace.two.advanced(by: 9) == ClockFace.two.advanced(by: -39)
```

## License

Clockmoji is published under the [MIT License](https://opensource.org/licenses/MIT).
