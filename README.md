# Clockmoji

Simple time formatting using clock emojis.

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
