//
//  User.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import Foundation

class User {
    static var currentUser: User?
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
