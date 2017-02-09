//
//  BaseParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/8/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import XCTest
import Parlance

enum TestKey {
    case one
    case two
}

final class BaseParlance_TestParlanceCoordinator: ParlanceCoordinatable {
    var languageToReturn: TestLanguage!
    
    static let shared = BaseParlance_TestParlanceCoordinator()
    
    func currentLanguage(for locale: Locale) -> TestLanguage {
        return languageToReturn
    }
    
    func category(for int: Int, language: TestLanguage) -> PluralCategory {
        return .zero
    }
}

final class TestBaseParlance: BaseParlance {
    typealias _ParlanceCoordinator = BaseParlance_TestParlanceCoordinator
    static let shared = TestBaseParlance()
    
    func t(_ key: TestKey) -> String {
        switch key {
        case .one:
            return "one"
        case .two:
            return "two"
        }
    }
}

class BaseParlanceTests: XCTestCase {
    func testStaticFunctionT() {
        // When translating the key .one
        let result1 = TestBaseParlance.t(.one)
        
        // Then should use shared.t()
        XCTAssert(result1 == "one", "should return the translated string 'one'")
        
        // When translating the key .one
        let result2 = TestBaseParlance.t(.two)
        
        // Then should use shared.t()
        XCTAssert(result2 == "two", "should return the translated string 'two'")
    }
    
    func testCurrentLanguage() {
        // Given
        let subject = TestBaseParlance.shared
        
        // When the current language is .languageOne
        BaseParlance_TestParlanceCoordinator.shared.languageToReturn = .languageOne
        
        // Then should get language from _ParlanceCoordinator
        XCTAssert(subject.currentLanguage == .languageOne, "should return .languageOne")
        
        // When the current language is .languageTwo
        BaseParlance_TestParlanceCoordinator.shared.languageToReturn = .languageTwo
        
        // Then should get language from _ParlanceCoordinator
        XCTAssert(subject.currentLanguage == .languageTwo, "should return .languageTwo")
    }
}
