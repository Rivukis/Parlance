//
//  ParlanceModules.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import Foundation

enum Language {
    case english
    case spanish
}

enum EnglishPluralCategory: String {
    case one
    case other
}

enum SpanishPluralCategory: String {
    case one
    case other
}

final class ParlanceCoordinator: ParlanceCoordinatable {
    static let shared = ParlanceCoordinator()
    
    func currentLanguage(for locale: Locale) -> Language {
        if locale.languageCode == "es" {
            return .spanish
        }
        
        return .english
    }
    
    func category(for int: Int, language: Language) -> PluralCategory {
        switch language {
        case .english:
            return int == 1 ? .one : .other
        case .spanish:
            return int == 1 ? .one : .other
        }
    }
}
