//
//  ReusableUIParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

enum ReusableUIParlanceKey {
    case signOutAlertTitle
    case alertAcceptanceText
}

final class ReusableUIParlance: BaseModule {
    static let shared = ReusableUIParlance()
    
    let localeCoordinator = LocaleCoordinator()
    let en = ReusableUIParlance_en()
    let es = ReusableUIParlance_es()
    
    func t(_ key: ReusableUIParlanceKey) -> String {
        switch localeCoordinator.currentLanguage {
        case .english:
            return en.t(key)
        case .spanish:
            return es.t(key)
        }
    }
}
