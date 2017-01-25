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

class AlertControllerBuilder {
    let parlance: ReusableUIParlance
    
    init(parlance: ReusableUIParlance) {
        self.parlance = parlance
    }
    
    func alertController(withType type: AlertType) -> UIAlertController {
        switch type {
        case .signedOut:
            let alertController = UIAlertController(title: parlance.t(.signOutAlertTitle), message: nil, preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: parlance.t(.alertAcceptanceText), style: .default)
            alertController.addAction(acceptAction)
            return alertController
        }
    }
}
