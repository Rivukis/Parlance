//
//  ParlanceCoordinatableSpec.swift
//  Parlance
//
//  Created by Brian Radebaugh on 2/8/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import XCTest
import Parlance

enum TestLanguage {
    case languageOne
    case languageTwo
}

final class TestParlanceCoordinator: ParlanceCoordinatable {
    var languageToReturn: TestLanguage!
    
    static let shared = TestParlanceCoordinator()
    
    func currentLanguage(for locale: Locale) -> TestLanguage {
        return languageToReturn
    }
    
    func category(for int: Int, language: TestLanguage) -> PluralCategory {
        if language == .languageTwo {
            return .other
        }
        
        switch int {
        case 0:
            return .zero
        case 1:
            return .one
        case 2:
            return .two
        case 3:
            return .few
        case 4:
            return .many
        default:
            return .other
        }
    }
}

class ParlanceCoordinatableTests: XCTestCase {
    func testCurrentLanguage() {
        // Given
        let subject = TestParlanceCoordinator()
        
        // When the language is .languageOne
        subject.languageToReturn = .languageOne
        
        // Then
        XCTAssert(subject.currentLanguage == .languageOne, "should get the language from category(for:)")
        
        // When the language is .languageTwo
        subject.languageToReturn = .languageTwo
        
        // Then
        XCTAssert(subject.currentLanguage == .languageTwo, "should get the language from category(for:)")
    }
    
    func testRawCategoryValues() {
        // Given
        let subject = TestParlanceCoordinator()
        subject.languageToReturn = .languageOne
        
        // When int is 0
        var int = 0
        
        // Then return the raw value of PluralCategory of zero
        XCTAssert(subject.rawCategory(for: int) == "zero", "should return the raw value of 'zero'")
        
        // When int is 1
        int = 1
        
        // Then return the raw value of PluralCategory of one
        XCTAssert(subject.rawCategory(for: int) == "one", "should return the raw value of 'one'")
        
        // When int is 2
        int = 2
        
        // Then return the raw value of PluralCategory of two
        XCTAssert(subject.rawCategory(for: int) == "two", "should return the raw value of 'two'")
        
        // When int is 3
        int = 3
        
        // Then return the raw value of PluralCategory of few
        XCTAssert(subject.rawCategory(for: int) == "few", "should return the raw value of 'few'")
        
        // When int is 4
        int = 4
        
        // Then return the raw value of PluralCategory of many
        XCTAssert(subject.rawCategory(for: int) == "many", "should return the raw value of 'many'")
        
        // When int is 5
        int = 5
        
        // Then return the raw value of PluralCategory of other
        XCTAssert(subject.rawCategory(for: int) == "other", "should return the raw value of 'other'")
    }
    
    func testRawValueLanguage() {
        // Given
        let subject = TestParlanceCoordinator()
        
        // When the language is .languageOne
        subject.languageToReturn = .languageOne
        
        // Then should respect the language
        XCTAssert(subject.rawCategory(for: 0) == "zero", "should return the raw value of 'zero'")
        
        // When the language is .languageTwo
        subject.languageToReturn = .languageTwo
        
        // Then should respect the language
        XCTAssert(subject.rawCategory(for: 0) == "other", "should return the raw value of 'other'")
    }
}
