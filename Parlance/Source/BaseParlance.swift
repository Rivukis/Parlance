//
//  BaseParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/**
 Types conforming to `BaseParlance` are **used** to translate `Key` into a `String` appropriate for the current `Language`. The current `Language` is determined by '_ParlanceCoordinator'.

 The **purpose** of types conforming to `BaseParlance` is to trampoline calls to `t(key:)` to the corresponding `t(key:)` on the appropriate `SpecificParlance`. This `SpecificParlance` needs to use the same type for `Key` and be specific to the `Language` returned by `currentLanguage`.
 
 - Note: Only one type conforming to `BaseParlance` per *module\/section*.
 
 ## Example Usage ##
 ```swift
 final class SignInParlance: BaseParlance {
     typealias _ParlanceCoordinator = ParlanceCoordinator
     static let shared = SignInParlance()
 
     func t(_ key: SignInParlanceKey) -> String {
         switch currentLanguage {
         case .english:
             return SignInParlance_en.shared.t(key)
         case .spanish:
             return SignInParlance_es.shared.t(key)
         }
     }
 }
 ```
 */
public protocol BaseParlance {
    /**
     The associated type `_ParlanceCoordinator`. Must conform to `ParlanceCoordinatable`.
          
     ## Example Usage ##
     ```
     class ParlanceCoordinator: ParlanceCoordinatable {
         // ...
     }
     
     typealias _ParlanceCoordinator = ParlanceCoordinator
     ```
     */
    associatedtype _ParlanceCoordinator: ParlanceCoordinatable
    
    /**
     The shared instance.
     
     ## Example Usage ##
     ```
     static let shared = SignInParlance()
     ```
     */
    static var shared: Self { get }
    
    /**
     The function used to translate `Key` into a `String` appropriate for the current `Language`. The current `Language` is determined by '_ParlanceCoordinator'.
     
     The **purpose** of `t(key:)` is to tampoline this call to the corresponding `t(key:)` on the appropriate `SpecificParlance`. This `SpecificParlance` needs to use the same type for `Key` and be specific to the `Language` returned by `currentLanguage`.
     
     ## Example Usage ##
     ```swift
     func t(_ key: SignInParlanceKey) -> String {
         switch currentLanguage {
         case .english:
             return SignInParlance_en.shared.t(key)
         case .spanish:
             return SignInParlance_es.shared.t(key)
         }
     }
     ```
     */
    func t(_ key: Key) -> String
    
    /**
     The associated type `Key`.
     
     - Important: Best if Key is an enum. Can leverage associated values for inputs to the translation.
     - Note: Can be inferred by specifying the type in the function `t(key:)`
     
     ## Example Usage ##
     ```
     enum SignInParlanceKey {
         case english
         caes spanish
     }
     
     // Specifying the type directly.
     typealias Key = SignInParlanceKey
     
     // OR
     
     // Specifying the type using type-inferrence.
     func t(_ key: SignInParlanceKey) {
         // ...
     }
     ```
     */
    associatedtype Key
}

public extension BaseParlance {
    // TODO: add docs
    static func t(_ key: Key) -> String {
        return Self.shared.t(key)
    }
    
    /**
     Get the current `Language` from the shared instance of `_ParlanceCoordinator`.
     
     - Important: Do NOT override.
     
     ## Example Usage ##
     ```swift
     switch currentLanguage {
     case .english:
         // ...
     case .spanish:
         // ...
     }
     ```
     */
    var currentLanguage: _ParlanceCoordinator.Language {
        return _ParlanceCoordinator.shared.currentLanguage
    }
}
