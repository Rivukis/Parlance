//
//  BaseParlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/**
 Types conforming to `BaseParlance` are **used** to translate `Key` into a `String` localized and/or pluralized for the current `Language`. The current `Language` is determined by '_ParlanceCoordinator'.

 The **purpose** of types conforming to `BaseParlance` is to trampoline calls to the `t(key:)` function to the corresponding `t(key:)` function on the appropriate `SpecificParlance`. This `SpecificParlance` needs to use the same type for `Key` and be specific to the `Language` returned by `currentLanguage`.
 
 - Note: Should only need one type conforming to `BaseParlance` per *module* or area of the project.
 
 ## Example Implementation ##
 ```swift
 final class SignInParlance: BaseParlance {
     typealias _ParlanceCoordinator = ParlanceCoordinator
     static let shared = SignInParlance()
 
     func t(_ key: SignInParlanceKey) -> String {
         switch currentLanguage {
         case .english:
             return SignInParlance_en.t(key)
         case .spanish:
             return SignInParlance_es.t(key)
         }
     }
 }
 ```
 */
public protocol BaseParlance {
    /**
     The associated type `_ParlanceCoordinator`. Must conform to `ParlanceCoordinatable`.
          
     ## Example Implementation ##
     ```
     typealias _ParlanceCoordinator = ParlanceCoordinator
     ```
     */
    associatedtype _ParlanceCoordinator: ParlanceCoordinatable
    
    /**
     The function used to translate `Key` into a `String` localized and/or pluralized for the current `Language`. The current `Language` is determined by '_ParlanceCoordinator'.
     
     The **purpose** of `t(key:)` is to tampoline this call to the corresponding `t(key:)` to the static function on appropriate `SpecificParlance`. This `SpecificParlance` needs to use the same type for `Key` and be specific to the `Language` returned by `currentLanguage`.
     
     ## Example Implementation ##
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
     
     - Parameter key: The `Key` to be localized and/or pluralized.
     - Returns: The localized and/or pluralized `String`.
     */
    func t(_ key: Key) -> String
    
    /**
     The associated type `Key`.
     
     - Important: Best if `Key` is an enum. If `Key` is an enum then use associated values for dynamic inputs into the localization process.
     - Note: Can be inferred by specifying the type in the instance function `t(key:)`
     
     ## Example Implementation ##
     ```
     enum SignInParlanceKey {
         case welcomeMessage(name: String)
     }
     
     // Specifying the type using type-inference.
     func t(_ key: SignInParlanceKey) {
         // ...
     }
     ```
     */
    associatedtype Key
}

public extension BaseParlance {
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
