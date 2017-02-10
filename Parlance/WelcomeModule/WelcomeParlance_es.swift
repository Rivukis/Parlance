//
//  WelcomeParlance_es.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class WelcomeParlance_es: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = SpanishPluralCategory
    
    static func t(_ key: WelcomeParlanceKey) -> String {
        switch key {
        case .signInButtonText:
            return "registrarse"
        case .signOutButtonText:
            return "desconectar"
        case .genericWelcomeMessage:
            return "Bienvenido!"
        case .welcomeMessage(name: let name):
            return "Bienvenido, \(name)!"
        case .sessionsCount(let count):
            switch category(for: count) {
            case .one:
                return "1 sesión"
            case .other:
                return "\(count) sesiones"
            }
        }
    }
}
