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

final class ReusableUIParlance: BaseParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    static let shared = ReusableUIParlance()
    
    func t(_ key: ReusableUIParlanceKey) -> String {
        switch currentLanguage {
        case .english:
            return ReusableUIParlance_en.t(key)
        case .spanish:
            return ReusableUIParlance_es.t(key)
        }
    }
}
