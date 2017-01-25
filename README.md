TODO: Update me!!

# Parlance

[![CI Status](http://img.shields.io/travis/Brian Radebaugh/Parlance.svg?style=flat)](https://travis-ci.org/Brian Radebaugh/Parlance)
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

final class LocaleCoordinator: LocaleCoordinatable {
    static let shared = LocaleCoordinator()
    
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
* Make a `final` class that conforms to `BaseModule`
* Provide a `shared` instance
* Get the shared instance of the class conforming to LocaleCoordinatable
* Get the shared instance of all classes conforming `SpecificModule` for each language for this module
* Trampoline each call to `t()` to the corressponding Specific Module's `t()` for the current language

### Example

```swift
enum LogInParlanceKey {
    case signedInWelcomeMessage(name: String)
    case guestWelcomeMessage
}

final class LogInParlance: BaseModule {
    static let shared = LogInParlance()
    let localeCoordinator = LocaleCoordinator.shared
    let en = LoginParlance_EN.shared
    let ga = LoginParlance_GA.shared
    
    func t(_ key: LogInParlanceKey) -> String {
        switch localeCoordinator.currentLanguage {
        case .english: return en.t(key)
        case .irish: return ga.t(key)
        }
    }
}

enum ShoppingCartParlanceKey {
    case numberOfItems(Int)
}

final class ShoppingCartParlance: BaseModule {
    static let shared = ShoppingCartParlance()
    let localeCoordinator = LocaleCoordinator.shared
    let en = ShoppingCartParlance_EN.shared
    let ga = ShoppingCartParlance_GA.shared
    
    func t(_ key: ShoppingCartParlanceKey) -> String {
        switch localeCoordinator.currentLanguage {
        case .english: return en.t(key)
        case .irish: return ga.t(key)
        }
    }
}
```

## Creating a Specific Module

* List out the plural categories for the language (once per language)
* Make a `final` class that conforms to `SpecificModule`
* Provide a `shared` instance
* Provide the correct translation for the given key
** use `category(for:)` to get the plural category for any `Int`s

### Example

```swift
enum EnglishPluralCategory: String {
    case one
    case other
}

final class LoginParlance_EN: SpecificModule {
    typealias PluralCategory = EnglishPluralCategory
    static let shared = LoginParlance_EN()

    func t(_ key: LogInParlanceKey) -> String {
        switch key {
        case .signedInWelcomeMessage(name: let name):
            return "Welcome, " + name

        case .guestWelcomeMessage:
            return "Welcome"
        }
    }
}

final class ShoppingCartParlance_EN: SpecificModule {
    typealias PluralCategory = EnglishPluralCategory
    static let shared = ShoppingCartParlance_EN()

    func t(_ key: ShoppingCartParlanceKey) -> String {
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
pod "Parlance"
```

## Author

Brian Radebaugh, rivukis@gmail.com

## License

Parlance is available under the MIT license. See the LICENSE file for more info.
