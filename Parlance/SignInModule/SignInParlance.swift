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
    typealias _LocaleCoordinator = LocaleCoordinator
    static let shared = SignInParlance()
    
    func t(_ key: SignInParlanceKey) -> String {
        switch currentLanguage {
        case .english:
            return SignInParlance_en.shared.t(key)
        case .spanish:
            return SignInParlance_es.shared.t(key)
        }
    }
}
