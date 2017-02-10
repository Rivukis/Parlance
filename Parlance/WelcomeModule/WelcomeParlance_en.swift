//
//  WelcomeParlance_en.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class WelcomeParlance_en: SpecificParlance {
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
