//
//  ClockFace.swift
//  Clockmoji
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016-2017 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// A clock face with a raw emoji value.
public enum ClockFace: Character, Comparable, Strideable, CustomStringConvertible {

    #if swift(>=3)

    /// One o'clock.
    case one = "🕐"

    /// One thirty.
    case oneThirty = "🕜"

    /// Two o'clock.
    case two = "🕑"

    /// Two thirty.
    case twoThirty = "🕝"

    /// Three o'clock.
    case three = "🕒"

    /// Three thirty.
    case threeThirty = "🕞"

    /// Four o'clock.
    case four = "🕓"

    /// Four thirty.
    case fourThirty = "🕟"

    /// Five o'clock.
    case five = "🕔"

    /// Five thirty.
    case fiveThirty = "🕠"

    /// Six o'clock.
    case six = "🕕"

    /// Six thirty.
    case sixThirty = "🕡"

    /// Seven o'clock.
    case seven = "🕖"

    /// Seven thirty.
    case sevenThirty = "🕢"

    /// Eight o'clock.
    case eight = "🕗"

    /// Eight thirty.
    case eightThirty = "🕣"

    /// Nine o'clock.
    case nine = "🕘"

    /// Nine thirty.
    case nineThirty = "🕤"

    /// Ten o'clock.
    case ten = "🕙"

    /// Ten thirty.
    case tenThirty = "🕥"

    /// Eleven o'clock.
    case eleven = "🕚"

    /// Eleven thirty.
    case elevenThirty = "🕦"

    /// Twelve o'clock.
    case twelve = "🕛"

    /// Twelve thirty.
    case twelveThirty = "🕧"

    /// All clock faces.
    public static let all = Array(ClockFace.one...ClockFace.twelveThirty)

    #else

    /// One o'clock.
    case One = "🕐"

    /// One thirty.
    case OneThirty = "🕜"

    /// Two o'clock.
    case Two = "🕑"

    /// Two thirty.
    case TwoThirty = "🕝"

    /// Three o'clock.
    case Three = "🕒"

    /// Three thirty.
    case ThreeThirty = "🕞"

    /// Four o'clock.
    case Four = "🕓"

    /// Four thirty.
    case FourThirty = "🕟"

    /// Five o'clock.
    case Five = "🕔"

    /// Five thirty.
    case FiveThirty = "🕠"

    /// Six o'clock.
    case Six = "🕕"

    /// Six thirty.
    case SixThirty = "🕡"

    /// Seven o'clock.
    case Seven = "🕖"

    /// Seven thirty.
    case SevenThirty = "🕢"

    /// Eight o'clock.
    case Eight = "🕗"

    /// Eight thirty.
    case EightThirty = "🕣"

    /// Nine o'clock.
    case Nine = "🕘"

    /// Nine thirty.
    case NineThirty = "🕤"

    /// Ten o'clock.
    case Ten = "🕙"

    /// Ten thirty.
    case TenThirty = "🕥"

    /// Eleven o'clock.
    case Eleven = "🕚"

    /// Eleven thirty.
    case ElevenThirty = "🕦"

    /// Twelve o'clock.
    case Twelve = "🕛"

    /// Twelve thirty.
    case TwelveThirty = "🕧"

    /// All clock faces.
    public static let all = (UInt8(0)..<24).map({ unsafeBitCast($0, ClockFace.self) })

    #endif

    /// The name bases of all clock faces.
    private static let _nameBases = ["One",  "Two", "Three",  "Four",
                                     "Five", "Six", "Seven",  "Eight",
                                     "Nine", "Ten", "Eleven", "Twelve"]

    /// The name for `self`.
    public var name: String {
        return ClockFace._nameBases[hashValue >> 1] + (isHalfHour ? " thirty" : "")
    }

    /// The name for `self` with the "o'clock" additive if `isHour` is `true`.
    public var nameWithAdditive: String {
        return name + additive
    }

    /// A textual representation of this instance.
    public var description: String {
        return String(rawValue)
    }

    /// The description for `self` with the "o'clock" additive if `isHour` is `true`.
    public var descriptionWithAdditive: String {
        return description + additive
    }

    /// The additive for `self`. Is " o'clock" (with the space) if `isHour` is `true`.
    public var additive: String {
        return isHour ? " o'clock" : ""
    }

    /// Whether `self` is a whole hour.
    public var isHour: Bool {
        return hashValue % 2 == 0
    }

    /// Whether `self` is a half hour.
    public var isHalfHour: Bool {
        return !isHour
    }

    /// The time interval for `self`.
    public var timeInterval: Double {
        return Double(hashValue + 2) * 1800
    }

    /// Creates a clock face from `time`.
    ///
    /// - parameter time: The time in hours for the clock in a 12-hour interval.
    public init(time: Double) {
        #if swift(>=3)
            self = ClockFace.twelve.advanced(by: Int(time * 2))
        #else
            self = ClockFace.Twelve.advancedBy(Int(time * 2))
        #endif
    }

    /// Creates a clock face from `timeInterval`.
    ///
    /// - parameter timeInterval: The time interval in seconds for the clock.
    public init(timeInterval: Double) {
        self.init(time: timeInterval / 3600)
    }

    #if swift(>=3)

    /// Creates a clock face from `date` and `calendar`.
    ///
    /// - parameter date: The date for which to create the clock. The default value is `Date()`.
    /// - parameter calendar: The calendar with which to get hours and minutes from `date`. The default value is
    ///   `current`.
    public init(date: Date = Date(), calendar: Calendar = .current) {
        let hours   = Double(calendar.component(.hour,   from: date))
        let minutes = Double(calendar.component(.minute, from: date)) / 60
        self.init(time: hours + minutes)
    }

    #else

    /// Creates a clock face from `date` and `calendar`.
    ///
    /// - parameter date: The date for which to create the clock. The default value is `NSDate()`.
    /// - parameter calendar: The calendar with which to get hours and minutes from `date`. The default value is
    ///   `currentCalendar()`.
    public init(date: NSDate = NSDate(), calendar: NSCalendar = .currentCalendar()) {
        let hours   = Double(calendar.component(.Hour,   fromDate: date))
        let minutes = Double(calendar.component(.Minute, fromDate: date)) / 60
        self.init(time: hours + minutes)
    }

    #endif

    #if swift(>=3)

    /// Returns a stride `x` such that `self.advanced(by: x) == other`.
    ///
    /// - Complexity: O(1).
    public func distance(to other: ClockFace) -> Int {
        return other.hashValue - self.hashValue
    }

    /// Returns a `Self` `x` such that `self.distance(to: x) == n`.
    ///
    /// - Complexity: O(1).
    public func advanced(by n: Int) -> ClockFace {
        guard n != 0 else {
            return self
        }
        let advanced: Int = n < 0
            ? (hashValue.advanced(by: n % 24) + 24) % 24
            :  hashValue.advanced(by: n % 24) % 24
        return unsafeBitCast(UInt8(advanced), to: ClockFace.self)
    }

    #else

    /// Returns a stride `x` such that `self.advancedBy(x) == other`.
    ///
    /// - Complexity: O(1).
    public func distanceTo(other: ClockFace) -> Int {
        return other.hashValue - self.hashValue
    }

    /// Returns a `Self` `x` such that `self.distanceTo(x) == n`.
    ///
    /// - Complexity: O(1).
    public func advancedBy(n: Int) -> ClockFace {
        guard n != 0 else {
            return self
        }
        let advanced: Int = n < 0
            ? (hashValue.advancedBy(n % 24) + 24) % 24
            :  hashValue.advancedBy(n % 24) % 24
        return unsafeBitCast(UInt8(advanced), ClockFace.self)
    }

    #endif

}

/// Returns a Boolean value that indicates whether the first argument is less than the second argument.
public func < (lhs: ClockFace, rhs: ClockFace) -> Bool {
    return lhs.hashValue < rhs.hashValue
}
