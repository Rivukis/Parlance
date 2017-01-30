//
//  ParlanceCoordinatable.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import Foundation

/**
 Types conforming to this protocol provide the type to use for `Language`, the current language, and the plural category for a specific scenario.
 
 - Note: Only one type conforming to ParlanceCoordinatable is necessary per project.
 */
public protocol ParlanceCoordinatable {
    /**
     Must provide a shared instance.
     
     ## Example Conformance ##
     ````
     static let shared = ParlanceCoordinator()
     ````
     */
    static var shared: Self { get }
    
    /**
     Must provide the `Language` to use for a given `Locale`.
     
     - Important: Do NOT call this method. Only implement it.
     - SeeAlso: var `currentLanguage` in ParlanceCoordinatable extension
     
     - Parameter locale: The current `Locale` given by the system.
     - Returns: The Language that Parlance will use.
     */
    func currentLanguage(for locale: Locale) -> Language
    
    /**
     Must provide the `PluralCategory` to use for a given `Int` and `Language`.
     
     - Parameter int: The `Int` used to determine the `PluralCategory`.
     - Parameter language: The `Language` used to determine the `PluralCategory`.
     - Returns: the `PluralCategory` for the given `Int` and `Language`.
     */
    func category(for int: Int, language: Language) -> PluralCategory
    
    // Can be infered from instance function `category(for:language:)`
    
    /**
     Must specify the type to be used as the Language.
     
     - Important: Best if Language is an enum.
     - Note: Can be inferred by specifying the type in the function `category(for:language:)`
     */
    associatedtype Language
}

public extension ParlanceCoordinatable {
    /**
     The current language from currentLanguage(for:).
     */
    var currentLanguage: Language {
        return currentLanguage(for: Locale.current)
    }
    
    /**
     Get the `rawValue` of the PluralCategory for the given `Int` for the `currentLanguage`.
     
     - Attention: FOR INTERNAL USE ONLY. DO NOT EXECUTE OR OVERRIDE.
     
     - Parameter int: The `Int` used to determine the `PluralCategory`.
     - Returns: the `rawValue` of the `PluralCategory` for the `currentLanguage`.
     */
    func rawCategory(for int: Int) -> String {
        let mycategory = category(for: int, language: currentLanguage)
        return mycategory.rawValue
    }
}
