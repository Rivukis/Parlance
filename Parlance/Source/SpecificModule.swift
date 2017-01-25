//
//  SpecificModule.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/* TODO: to get rid of specifying _LocaleCoordinator
 Type Erasure -> AnyLocaleCoordinator
 Curry -> category(for:using:) to be just category(for:)
 */

public protocol SpecificModule {
    // Provided by extension
    static func t(_ key: Key) -> String
    func category(for int: Int) -> PluralCategory
    
    // Can be infered from instance function `t()`
    associatedtype Key
    
    // Required
    associatedtype _LocaleCoordinator: LocaleCoordinatable
    associatedtype PluralCategory: RawRepresentable // ONLY include values from 'PluralCategory' && RawValue == String
    static var shared: Self { get }
    func t(_ key: Key) -> String
}

public extension SpecificModule {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
}

public extension SpecificModule where PluralCategory.RawValue == String {
    func category(for int: Int) -> PluralCategory {
        let rawValue = _LocaleCoordinator.shared.rawCategory(for: int)
        guard let category = PluralCategory(rawValue: rawValue) else {
            fatalError("\(type(of: PluralCategory.self)) does not have member \"\(rawValue)\".")
        }
        
        return category
    }
}
