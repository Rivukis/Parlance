//
//  SpecificModule.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/* TODO: to get rid of specifying LocaleCoordinator
 Type Erasure -> AnyLocaleCoordinator
 Curry -> category(for:using:) to be just category(for:)
 */

protocol SpecificModule {
    // Provided by extension
    static func t(_ key: Key) -> String
    func category<T: LocaleCoordinatable>(for int: Int, using localeCoordinator: T) -> PluralCategory
    
    // Can be infered from instance function `t()`
    associatedtype Key
    
    // Required
    associatedtype PluralCategory: RawRepresentable // ONLY include values from 'PluralCategory' && RawValue == String
    static var shared: Self { get }
    func t(_ key: Key) -> String
}

extension SpecificModule {
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
}

extension SpecificModule where PluralCategory.RawValue == String {
    func category<T: LocaleCoordinatable>(for int: Int, using localeCoordinator: T) -> PluralCategory {
        let rawValue = localeCoordinator.rawCategory(for: int)
        guard let category = PluralCategory(rawValue: rawValue) else {
            fatalError("\(type(of: PluralCategory.self)) does not have member \"\(rawValue)\".")
        }
        
        return category
    }
}
