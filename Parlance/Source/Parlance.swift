//
//  Parlance.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

public class Parlance {
    static func t<T: BaseModule>(_ module: T.Type, _ key: T.Key) -> String {
        return T.t(key)
    }
}
