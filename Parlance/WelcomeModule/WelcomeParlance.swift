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
}

final class WelcomeParlance: BaseModule {
    typealias _LocaleCoordinator = LocaleCoordinator
    static let shared = WelcomeParlance()
    
    func t(_ key: WelcomeParlanceKey) -> String {
        switch currentLanguage {
        case .english:
            return WelcomeParlance_en.shared.t(key)
        case .spanish:
            return WelcomeParlance_es.shared.t(key)
        }
    }
}
