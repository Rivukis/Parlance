# Parlance

[![Version](https://img.shields.io/cocoapods/v/Parlance.svg?style=flat)](http://cocoapods.org/pods/Parlance)
[![License](https://img.shields.io/cocoapods/l/Parlance.svg?style=flat)](http://cocoapods.org/pods/Parlance)
[![Platform](https://img.shields.io/cocoapods/p/Parlance.svg?style=flat)](http://cocoapods.org/pods/Parlance)

Parlance is a localization and pluralization framework for iOS apps written in Swift.

## Specifying Languages and Pluralization Rules

* List out the supported languages
* Provide a `shared` instance
* Choose which language to use for the given `Locale`
* Choose which plural category to use for the given `Int` and `Language`

### For reference on pluralization rules see

[Plural Rules](http://cldr.unicode.org/index/cldr-spec/plural-rules)
[Plural Rules Per Language](http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html) (Note: use the Cardinal type)

### Example

```swift
// Supported Languages
enum Language {
    case english
    case irish
}

final class ParlanceCoordinator: ParlanceCoordinatable {
    static let shared = ParlanceCoordinator()
    
    // Language to use for the given Locale
    func currentLanguage(for locale: Locale) -> Language {
        switch locale.languageCode {
        case "ga"?: return .irish
        default: return .english
        }
    }
    
    // Plural Category for the given Int and Language
    func category(for int: Int, language: Language) -> PluralCategory {
        switch language {
        case .english:
            switch int {
            case 1: return .one
            default: return .other
            }
            
        case .irish:
            switch int {
            case 1: return .one
            case 2: return .two
            case _ where int >= 3 && int <= 6: return .few
            case _ where int >= 7 && int <= 10: return .many
            default: return .other
            }
        }
    }
}
```

## Creating a Base Module

* List out the keys for each localized string
* Make a class that conforms to `BaseModule`
* Specify the type to use for _ParlanceCoordinatable
* Trampoline each call to `t()` to the corressponding language specific `SpecificParlance`'s static function, `t()`

### Example

```swift
enum LogInParlanceKey {
    case signedInWelcomeMessage(name: String)
    case guestWelcomeMessage
}

class LogInParlance: BaseParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    
    func t(_ key: LogInParlanceKey) -> String {
        switch currentLanguage {
        case .english: return LogInParlance_en.t(key)
        case .irish: return LogInParlance_ga.t(key)
        }
    }
}

enum ShoppingCartParlanceKey {
    case numberOfItems(Int)
}

class ShoppingCartParlance: BaseParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    
    func t(_ key: ShoppingCartParlanceKey) -> String {
        switch currentLanguage {
        case .english: return en.t(key)
        case .irish: return ga.t(key)
        }
    }
}
```

## Creating a Specific Module

* List out the plural categories for the language (once per language)
* Make a class that conforms to `SpecificModule`
* Specify the type to use for _ParlanceCoordinatable
* Specify the type to use for _PluralCategory
* Provide the correct translation for the given key
** use `category(for:)` to get the plural category for any `Int`s

### Example

```swift
enum EnglishPluralCategory: String {
    case one
    case other
}

class LoginParlance_EN: SpecificModule {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias PluralCategory = EnglishPluralCategory

    static func t(_ key: LogInParlanceKey) -> String {
        switch key {
        case .signedInWelcomeMessage(name: let name): return "Welcome, " + name
        case .guestWelcomeMessage: return "Welcome"
        }
    }
}

class ShoppingCartParlance_EN: SpecificModule {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias PluralCategory = EnglishPluralCategory

    static func t(_ key: ShoppingCartParlanceKey) -> String {
        switch key {
        case .numberOfItems(let count):
            switch category(for: count) {
            case .one: return "1 item"
            case .other: return "\(count) items"
            }
        }
    }
}
```

## Project Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 8
* Swift 3

## Installation

Parlance is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform :ios, "10.0"
use_frameworks!

target "<YOUR_TARGET>" do
    pod "Parlance"
end
```

## Author

Brian Radebaugh, rivukis@gmail.com

## License

Parlance is available under the MIT license. See the LICENSE file for more info.
