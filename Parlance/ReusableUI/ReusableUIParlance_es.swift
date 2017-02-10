//
//  ReusableUIParlance_es.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class ReusableUIParlance_es: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = SpanishPluralCategory
    
    static func t(_ key: ReusableUIParlanceKey) -> String {
        switch key {
        case .alertAcceptanceText:
            return "Vale"
        case .signOutAlertTitle:
            return "Cerró Sesión"
        }
    }
}
