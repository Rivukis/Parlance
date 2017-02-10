//
//  SignInParlance_es.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/10/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

class SignInParlance_es: SpecificParlance {
    typealias _ParlanceCoordinator = ParlanceCoordinator
    typealias _PluralCategory = SpanishPluralCategory
    
    static func t(_ key: SignInParlanceKey) -> String {
        switch key {
        case .namePlaceholder:
            return "ingrese su nombre"
        case .passwordPlaceholder:
            return "introducir la contraseña"
        case .signInButtonText:
            return "registrarse"
        case .cancelButtonText:
            return "cancelar"
        }
    }
}
