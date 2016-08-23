//
//  ClockFace.swift
//  Clockmoji
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Nikolai Vazquez
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

/// A clock face with a raw emoji value.
public enum ClockFace: Character, CustomStringConvertible {

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

    #endif

    /// A textual representation of this instance.
    public var description: String {
        return String(rawValue)
    }

}
