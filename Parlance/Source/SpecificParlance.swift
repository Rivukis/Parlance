//
//  SpecificParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/**
 Types conforming to `SpecificParlance` are **used** to translate `Key` into a `String` localized and/or pluralized for a specific `Language`.
 
 - Note: Types conforming to `SpecificParlance` should ONLY need to be used by types conforming to `BaseParlance.`
 
 ## Example Implementation ##
 ```swift
 final class SignInParlance_en: SpecificParlance {
     typealias _ParlanceCoordinator = ParlanceCoordinator
     typealias PluralCategory = EnglishPluralCategory
 
     static func t(_ key: SignInParlanceKey) -> String {
         switch key {
         case .namePlaceholder:
             return "enter name"
         case .welcomeMessage(let name):
             return "Welcome, \(name)!"
         case .retriesLeft(let count):
             switch category(for: count) {
             case .one:
                 return "1 retry left"
             case .other:
                 return "\(count) retries left"
             }
         }
     }
 }
 ```
 */
public protocol SpecificParlance {
    /**
     The associated type `Key`.
     
     - Important: Best if `Key` is an enum. If `Key` is an enum then use associated values for dynamic inputs into the localization process.
     - Note: Can be inferred by specifying the type in the function `t(key:)`
     
     ## Example Implementation ##
     ```
     enum SignInParlanceKey {
         case welcomeMessage(name: String)
     }
     
     // Specifying the type using type-inference.
     func t(_ key: SignInParlanceKey) {
         // ...
     }
     ```
     */
    associatedtype Key
    
    /**
     The associated type `_ParlanceCoordinator`. Must conform to `ParlanceCoordinatable`.
     
     ## Example Implementation ##
     ```
     typealias _ParlanceCoordinator = ParlanceCoordinator
     ```
     */
    associatedtype _ParlanceCoordinator: ParlanceCoordinatable
    
    /**
     The associated type `_PluralCategory`. Should be an enum specifying type `String`.
     
     - Important: `rawValue` can ONLY return values specified in `PluralCategory`
     - Note: If using an enum, derive the cases from `PluralCategory`.
     - Note: For information on a specific language's plural rules, see [Plural Rules per Language](http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html) (Use *Cardinal* type).
     
     ## Example Enum ##
     ```swift
     enum EnglishPluralCategory: String {
         case one
         case other
     }
     ```
     
     ## Example Implementation ##
     ```
     typealias _PluralCategory = EnglishPluralCategory
     ```
     */
    associatedtype _PluralCategory: RawRepresentable
    
    /**
     The function used to translate `Key` into a `String` localized and/or pluralized for a specific `Language`. The `Language` should be static for each type conforming to `SpecificParlance`.
     
     - Important: Should ONLY need to call this function from a `BaseParlance`.
     
     ## Example Implementation ##
     ```swift
     func t(_ key: IntroParlanceKey) -> String {
         switch key {
         case .welcomeMessage(let name):
             return "Welcome, \(name)!"
         }
     }
     ```
     
     - Parameter key: The `Key` to be localized and/or pluralized.
     - Returns: The localized and/or pluralized `String`.
     */
    static func t(_ key: Key) -> String
}

public extension SpecificParlance where _PluralCategory.RawValue == String {
    /**
     Returns the `_PluralCategory` for the given `Int`.
     
     The plural category is determined by `_ParlanceCoordinator`'s `category(for:language:)`.
     
     - Parameter int: the `Int` to be evaluated.
     - Returns: A `PluralCategory`, limited to the appropraite `Language`.
     */
    static func category(for int: Int) -> _PluralCategory {
        let rawValue = _ParlanceCoordinator.shared.rawCategory(for: int)
        guard let category = _PluralCategory(rawValue: rawValue) else {
            fatalError("\(type(of: _PluralCategory.self)) does not have member \"\(rawValue)\".")
        }
        
        return category
    }
}
