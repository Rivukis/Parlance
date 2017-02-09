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
    @IBOutlet weak var sessionCountLabel: UILabel! {
        didSet {
            sessionCountLabel.text = WelcomeParlance.t(.sessionsCount(sessionsCount))
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            let title = WelcomeParlance.t(.signInButtonText)
            signInButton.setTitle(title, for: .normal)
        }
    }
    @IBOutlet weak var signOutButton: UIButton! {
        didSet {
            signOutButton.layer.cornerRadius = 5
            let title = WelcomeParlance.t(.signOutButtonText)
            signOutButton.setTitle(title, for: .normal)
        }
    }
    
    var sessionsCount = 0
    let alertControllerBuilder = AlertControllerBuilder(parlance: ReusableUIParlance.shared)
    
    // MARK: Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let signInViewController = segue.destination as? SignInViewController {
            signInViewController.delegate = self
        }
    }
    
    // MARK: Actions
    
    @IBAction func signOutTapped(_ sender: Any) {
        if let _ = User.currentUser {
            User.currentUser = nil
            sessionsCount = 0
            let signedOutAlertController = alertControllerBuilder.alertController(withType: .signedOut)
            present(signedOutAlertController, animated: true)
            refresh()
        }
    }
    
    // MARK: Helper
    
    func refresh() {
        welcomeLabel.text = welcomeLabelText()
        sessionCountLabel.text = WelcomeParlance.t(.sessionsCount(sessionsCount))
    }
    
    func welcomeLabelText() -> String {
        if let user = User.currentUser {
            return WelcomeParlance.t(.welcomeMessage(name: user.name))
        }
        
        return WelcomeParlance.t(.genericWelcomeMessage)
    }
}

extension WelcomeViewController: SignInViewControllerDelegate {
    func didSignIn() {
        sessionsCount += 1
    }
}
