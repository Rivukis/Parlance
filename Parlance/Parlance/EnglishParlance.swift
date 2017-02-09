//
//  ParlanceEnglish.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

enum EnglishPluralCategory: String {
    case one
    case other
}

final class SignInParlance_en: SpecificParlance {
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

final class WelcomeParlance_en: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = EnglishPluralCategory
    
    static func t(_ key: WelcomeParlanceKey) -> String {
        switch key {
        case .signInButtonText:
            return "sign in"
        case .signOutButtonText:
            return "sign out"
        case .genericWelcomeMessage:
            return "Welcome!"
        case .welcomeMessage(name: let name):
            return "Welcome, \(name)!"
        case .sessionsCount(let count):
            switch category(for: count) {
            case .one:
                return "1 session"
            case .other:
                return "\(count) sessions"
            }
        }
    }
}

final class ReusableUIParlance_en: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = EnglishPluralCategory
    
    static func t(_ key: ReusableUIParlanceKey) -> String {
        switch key {
        case .alertAcceptanceText:
            return "OK"
        case .signOutAlertTitle:
            return "Signed Out"
        }
    }
}
