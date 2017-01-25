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
    static var shared: Self { get }
    func t(_ key: Key) -> String
}

extension BaseModule {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
}
