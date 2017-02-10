//
//  ReusableUIParlance_en.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class ReusableUIParlance_en: SpecificParlance {
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
