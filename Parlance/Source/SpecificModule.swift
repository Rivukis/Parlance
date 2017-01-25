//
//  SpecificModule.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

protocol SpecificModule {
    // Provided by extension
    static func t(_ key: Key) -> String
    func category(for int: Int) -> PluralCategory
    
    // Can be infered from instance function `t()`
    associatedtype Key
    
    // Required
    associatedtype PluralCategory: RawRepresentable // ONLY include values from 'PluralCategory'
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
