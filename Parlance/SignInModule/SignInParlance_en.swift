//
//  SignInParlance_en.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class SignInParlance_en: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = EnglishPluralCategory
    
    static func t(_ key: SignInParlanceKey) -> String {
        switch key {
        case .namePlaceholder:
            return "enter name"
        case .passwordPlaceholder:
            return "enter password"
        case .signInButtonText:
            return "sign in"
        case .cancelButtonText:
            return "cancel"
        }
    }
}
