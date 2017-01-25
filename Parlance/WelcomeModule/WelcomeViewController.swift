//
//  WelcomeViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

// TODO: Use shared instance of Parlance Module

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.text = welcomeLabelText()
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            signInButton.setTitle("sign in", for: .normal)
        }
    }
    @IBOutlet weak var signOutButton: UIButton! {
        didSet {
            signOutButton.layer.cornerRadius = 5
            signOutButton.setTitle("sign out", for: .normal)
        }
    }
    
    let alertControllerBuilder = AlertControllerBuilder()
    
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
            return "Welcome, \(user.name)!"
        }
        
        return "Welcome!"
    }
}
