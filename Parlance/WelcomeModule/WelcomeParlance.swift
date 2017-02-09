//
//  WelcomeParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

enum WelcomeParlanceKey {
    case signInButtonText
    case signOutButtonText
    case genericWelcomeMessage
    case welcomeMessage(name: String)
    case sessionsCount(Int)
}

final class WelcomeParlance: BaseParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    static let shared = WelcomeParlance()
    
    func t(_ key: WelcomeParlanceKey) -> String {
        switch currentLanguage {
        case .english:
            return WelcomeParlance_en.t(key)
        case .spanish:
            return WelcomeParlance_es.t(key)
        }
    }
}
