//
//  SpecificParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/* TODO: to get rid of specifying _ParlanceCoordinator
 Type Erasure -> AnyParlanceCoordinator
 Curry -> category(for:using:) to be just category(for:)
 */

public protocol SpecificParlance {
    associatedtype _ParlanceCoordinator: ParlanceCoordinatable
    associatedtype PluralCategory: RawRepresentable // ONLY include values from 'PluralCategory' && RawValue == String
    static var shared: Self { get }
    func t(_ key: Key) -> String
    
    // Can be infered from instance function `t()`
    associatedtype Key
}

public extension SpecificParlance {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
}

public extension SpecificParlance where PluralCategory.RawValue == String {
    func category(for int: Int) -> PluralCategory {
        let rawValue = _ParlanceCoordinator.shared.rawCategory(for: int)
        guard let category = PluralCategory(rawValue: rawValue) else {
            fatalError("\(type(of: PluralCategory.self)) does not have member \"\(rawValue)\".")
        }
        
        return category
    }
}
