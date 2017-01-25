//
//  AlertViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/25/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

enum AlertType {
    case signedOut
}

// TODO: Use an injected instance of Parlance Module

class AlertControllerBuilder {
    func alertController(withType type: AlertType) -> UIAlertController {
        switch type {
        case .signedOut:
            let alertController = UIAlertController(title: "Signed out", message: nil, preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(acceptAction)
            return alertController
        }
    }
}
