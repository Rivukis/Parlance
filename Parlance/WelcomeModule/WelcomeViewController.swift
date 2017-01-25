//
//  WelcomeViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.text = welcomeLabelText()
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            let title = Parlance.t(WelcomeParlance.self, .signInButtonText)
            signInButton.setTitle(title, for: .normal)
        }
    }
    @IBOutlet weak var signOutButton: UIButton! {
        didSet {
            signOutButton.layer.cornerRadius = 5
            let title = Parlance.t(WelcomeParlance.self, .signOutButtonText)
            signOutButton.setTitle(title, for: .normal)
        }
    }
    
    let alertControllerBuilder = AlertControllerBuilder(parlance: ReusableUIParlance.shared)
    
    // MARK: Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refresh()
    }
    
    // MARK: Actions
    
    @IBAction func signOutTapped(_ sender: Any) {
        if let _ = User.currentUser {
            User.currentUser = nil
            let signedOutAlertController = alertControllerBuilder.alertController(withType: .signedOut)
            present(signedOutAlertController, animated: true)
            refresh()
        }
    }
    
    // MARK: Helper
    
    func refresh() {
        welcomeLabel.text = welcomeLabelText()
    }
    
    func welcomeLabelText() -> String {
        if let user = User.currentUser {
            return Parlance.t(WelcomeParlance.self, .welcomeMessage(name: user.name))
        }
        
        return Parlance.t(WelcomeParlance.self, .genericWelcomeMessage)
    }
}
