//
//  SpecificParlanceTests.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/8/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import XCTest
import Parlance

enum TestPluralCategory: String {
    case zero
    case one
    case two
    case few
    case many
    case other
}

final class SpecificParlance_TestParlanceCoordinator: ParlanceCoordinatable {
    var categoryToReturn: PluralCategory!
    
    static let shared = SpecificParlance_TestParlanceCoordinator()
    
    func currentLanguage(for locale: Locale) -> TestLanguage {
        return .languageOne
    }
    
    func category(for int: Int, language: TestLanguage) -> PluralCategory {
        return categoryToReturn
    }
}

class TestSpecificParlance: SpecificParlance {
    typealias _ParlanceCoordinator = SpecificParlance_TestParlanceCoordinator
    typealias _PluralCategory = TestPluralCategory
    
    static func t(_ key: TestKey) -> String {
        return ""
    }
}

class SpecificParlanceTests: XCTestCase {
    func testCategory() {
        // When the `PluralCategory` is .zero
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .zero
        
        // Then return the `TestPluralCategory` version of zero
        XCTAssert(TestSpecificParlance.category(for: 0) == .zero, "should return 'zero'")
        
        // When the `PluralCategory` is .one
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .one
        
        // Then return the `TestPluralCategory` version of one
        XCTAssert(TestSpecificParlance.category(for: 0) == .one, "should return 'one'")
        
        // When the `PluralCategory` is .two
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .two
        
        // Then return the `TestPluralCategory` version of two
        XCTAssert(TestSpecificParlance.category(for: 0) == .two, "should return 'two'")
        
        // When the `PluralCategory` is .few
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .few
        
        // Then return the `TestPluralCategory` version of few
        XCTAssert(TestSpecificParlance.category(for: 0) == .few, "should return 'few'")
        
        // When the `PluralCategory` is .many
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .many
        
        // Then return the `TestPluralCategory` version of many
        XCTAssert(TestSpecificParlance.category(for: 0) == .many, "should return 'many'")
        
        // When the `PluralCategory` is .other
        SpecificParlance_TestParlanceCoordinator.shared.categoryToReturn = .other
        
        // Then return the `TestPluralCategory` version of other
        XCTAssert(TestSpecificParlance.category(for: 0) == .other, "should return 'zero'")
    }
}
