//
//  BaseParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

public protocol BaseParlance {
    associatedtype _ParlanceCoordinator: ParlanceCoordinatable
    static var shared: Self { get }
    func t(_ key: Key) -> String
    
    // Can be infered from instance function `t()`
    associatedtype Key
}

public extension BaseParlance {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
    
    var currentLanguage: _ParlanceCoordinator.Language {
        return _ParlanceCoordinator.shared.currentLanguage
    }
}
