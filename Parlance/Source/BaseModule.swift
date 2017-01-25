//
//  BaseModule.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

protocol BaseModule {
    // Provided by extension
    static func t(_ key: Key) -> String
    
    // Can be infered from instance function `t()`
    associatedtype Key
    
    // Required
    associatedtype _LocaleCoordinator: LocaleCoordinatable
    static var shared: Self { get }
    func t(_ key: Key) -> String
}

extension BaseModule {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
    
    var currentLanguage: _LocaleCoordinator.Language {
        return _LocaleCoordinator.shared.currentLanguage
    }
}
