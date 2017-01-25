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
    static let shared = WelcomeParlance()
    
    let localeCoordinator = LocaleCoordinator()
    let en = WelcomeParlance_en()
    let es = WelcomeParlance_es()
    
    func t(_ key: WelcomeParlanceKey) -> String {
        switch localeCoordinator.currentLanguage {
        case .english:
            return en.t(key)
        case .spanish:
            return es.t(key)
        }
    }
}
