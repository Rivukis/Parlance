//
//  SignInParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

enum SignInParlanceKey {
    case namePlaceholder
    case passwordPlaceholder
    case signInButtonText
    case cancelButtonText
}

final class SignInParlance: BaseModule {
    typealias LocaleCoordinator = MyLocaleCoordinator
    static let shared = SignInParlance()
    
    let en = SignInParlance_en()
    let es = SignInParlance_es()
    
    func t(_ key: SignInParlanceKey) -> String {
        switch currentLanguage {
        case .english:
            return en.t(key)
        case .spanish:
            return es.t(key)
        }
    }
}
