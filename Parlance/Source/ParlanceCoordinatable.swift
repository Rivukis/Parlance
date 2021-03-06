//
//  ParlanceCoordinatable.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import Foundation

/**
 Types conforming to this protocol provide the type to use for `Language`, the current `Language`, and the plural category for a specific scenario.
 
 - Note: Only one type conforming to ParlanceCoordinatable is necessary per project.
 */
public protocol ParlanceCoordinatable {
    /**
     The associated type `Language`.
     
     - Important: Best if Language is an enum.
     - Note: Can be inferred by specifying the type in the function `category(for:language:)`
     
     ## Example Implementation ##
     ```
     enum Language {
        case english
        case spanish
     }
     
     // Specifying the type using type-inference.
     func category(for: Int, language: Language) -> PluralCategory {
        // ...
     }
     ```
     */
    associatedtype _Language
    
    /**
     The shared instance.
     
     ## Example Implementation ##
     ```
     static let shared = ParlanceCoordinator()
     ```
     */
    static var shared: Self { get }
    
    /**
     The `Language` to use for a given `Locale`.
     
     - Important: Do NOT call this method, only implement it. To get the current `Language` use the variable `currentLanguage` instead.
     
     ## Example Implementation ##
     ```
     func currentLanguage(for locale: Locale) -> Language {
         if locale.languageCode == "es" {
             return .spanish
         }
     
         return .english
     }
     ```
     
     - Parameter locale: The current `Locale` returned by the system.
     - Returns: The Language that Parlance will use.
     */
    func currentLanguage(for locale: Locale) -> _Language
    
    /**
     The `PluralCategory` to use for a given `Int` and `Language`.
     
     - Important: Do NOT call this method. Only implement it.
     - SeeAlso: var `category(for:)` in SpecificParlance extension
     
     ## Example Implementation ##
     ```
     func category(for int: Int, language: Language) -> PluralCategory {
         switch language {
         case .english:
             if int == 1 {
                 return .one
             } else {
                 return .other
             }
     
         case .colognian:
             if int == 0 {
                 return .zero
             } else if int == 1 {
                 return .one
             } else {
                 return .other
             }
         }
     }
     ```
     
     - Parameter int: The `Int` used to determine the `PluralCategory`.
     - Parameter language: The `Language` used to determine the `PluralCategory`.
     - Returns: the `PluralCategory` for the given `Int` and `Language`.
     */
    func category(for int: Int, language: _Language) -> PluralCategory
}

public extension ParlanceCoordinatable {
    /**
     The current `Language` for `Locale.current`.
     
     ## Example Usage ##
     ```swift
     switch currentLanguage {
     case .english:
         // ...
     }
     ```
     */
    var currentLanguage: _Language {
        return currentLanguage(for: Locale.current)
    }
    
    /**
     Get the `rawValue` of the PluralCategory for the given `Int` for the `currentLanguage`.
     
     - Important: FOR INTERNAL USE ONLY. DO NOT USE OR OVERRIDE.
     
     - Parameter int: The `Int` used to determine the `PluralCategory`.
     - Returns: the `rawValue` of the `PluralCategory` for the `currentLanguage`.
     */
    func rawCategory(for int: Int) -> String {
        let mycategory = category(for: int, language: currentLanguage)
        return mycategory.rawValue
    }
}
