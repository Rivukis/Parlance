//
//  SpecificParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/**
 Types conforming to `BaseParlance` are **used** to translate `Key` into a `String` localized and/or pluralized for the current `Language`. The current `Language` is determined by '_ParlanceCoordinator'.
 
 The **purpose** of types conforming to `BaseParlance` is to trampoline calls to the `t(key:)` function to the corresponding `t(key:)` function on the appropriate `SpecificParlance`. This `SpecificParlance` needs to use the same type for `Key` and be specific to the `Language` returned by `currentLanguage`.
 
 - Note: Only one type conforming to `BaseParlance` per *module\/section*.
 
 ## Example Implementation ##
 ```swift
 final class SignInParlance_en: SpecificParlance {
     typealias _ParlanceCoordinator = ParlanceCoordinator
     typealias PluralCategory = EnglishPluralCategory
     static let shared = SignInParlance_en()
 
     static func t(_ key: SignInParlanceKey) -> String {
         switch key {
         case .namePlaceholder:
             return "enter name"
         case .welcomeMessage(let name):
             return "Welcome, \(name)!"
         }
     }
 }
 ```
 */
public protocol SpecificParlance {
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
     The shared instance.
     
     ## Example Implementation ##
     ```
     static let shared = SignInParlance()
     ```
     */
    static var shared: Self { get }
    
    /**
     The function used to translate `Key` into a `String` localized and/or pluralized for a specific `Language`. The `Language` should be static for each type conforming to `SpecificParlance`.
     
     - Important: ONLY call this function from a `BaseParlance`.
     
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
    
    /**
     The associated type `Key`.
     
     - Important: Best if `Key` is an enum. If `Key` is an enum then use associated values for dynamic inputs into the localization process.
     - Note: Can be inferred by specifying the type in the instance function `t(key:)`
     
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
}

public extension SpecificParlance where _PluralCategory.RawValue == String {
    func category(for int: Int) -> PluralCategory {
        let rawValue = _ParlanceCoordinator.shared.rawCategory(for: int)
        guard let category = PluralCategory(rawValue: rawValue) else {
            fatalError("\(type(of: PluralCategory.self)) does not have member \"\(rawValue)\".")
        }
        
        return category
    }
}
