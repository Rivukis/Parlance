//
//  LocaleCoordinatable.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import Foundation

public protocol LocaleCoordinatable {
    // Supplied
    var currentLanguage: Language { get }
    func rawCategory(for int: Int) -> String
    
    // Can be infered from instance function `category(for:language:)`
    associatedtype Language
    
    // Required
    static var shared: Self { get }
    func currentLanguage(for locale: Locale) -> Language
    func category(for int: Int, language: Language) -> PluralCategory
}

public extension LocaleCoordinatable {
    var currentLanguage: Language {
        return currentLanguage(for: Locale.current)
    }
    
    func rawCategory(for int: Int) -> String {
        let mycategory = category(for: int, language: currentLanguage)
        return mycategory.rawValue
    }
}
