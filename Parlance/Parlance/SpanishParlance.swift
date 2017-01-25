//
//  ParlanceSpanish.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

enum SpanishPluralCategory: String {
    case one
    case other
}

final class SignInParlance_es: SpecificModule {
    typealias LocaleCoordinator = MyLocaleCoordinator
    typealias PluralCategory = SpanishPluralCategory
    static let shared = SignInParlance_es()
    
    let localeCoordinator = LocaleCoordinator.shared
    
    func t(_ key: SignInParlanceKey) -> String {
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

final class WelcomeParlance_es: SpecificModule {
    typealias LocaleCoordinator = MyLocaleCoordinator
    typealias PluralCategory = SpanishPluralCategory
    static let shared = WelcomeParlance_es()
    
    let localeCoordinator = LocaleCoordinator.shared
    
    func t(_ key: WelcomeParlanceKey) -> String {
        switch key {
        case .signInButtonText:
            return "registrarse"
        case .signOutButtonText:
            return "desconectar"
        case .genericWelcomeMessage:
            return "Bienvenido!"
        case .welcomeMessage(name: let name):
            return "Bienvenido, \(name)!"
        }
    }
}

final class ReusableUIParlance_es: SpecificModule {
    typealias LocaleCoordinator = MyLocaleCoordinator
    typealias PluralCategory = SpanishPluralCategory
    static let shared = ReusableUIParlance_es()
    
    let localeCoordinator = LocaleCoordinator.shared
    
    func t(_ key: ReusableUIParlanceKey) -> String {
        switch key {
        case .alertAcceptanceText:
            return "Vale"
        case .signOutAlertTitle:
            return "Cerró Sesión"
        }
    }
}
