//
//  WelcomeViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    let parlance = WelcomeParlance()
    var sessionsCount = 0
    let alertControllerBuilder = AlertControllerBuilder(parlance: ReusableUIParlance())
    
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.text = welcomeLabelText()
        }
    }
    @IBOutlet weak var sessionCountLabel: UILabel! {
        didSet {
            sessionCountLabel.text = parlance.t(.sessionsCount(sessionsCount))
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            let title = parlance.t(.signInButtonText)
            signInButton.setTitle(title, for: .normal)
        }
    }
    @IBOutlet weak var signOutButton: UIButton! {
        didSet {
            signOutButton.layer.cornerRadius = 5
            let title = parlance.t(.signOutButtonText)
            signOutButton.setTitle(title, for: .normal)
        }
    }
    
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
        sessionCountLabel.text = parlance.t(.sessionsCount(sessionsCount))
    }
    
    func welcomeLabelText() -> String {
        if let user = User.currentUser {
            return parlance.t(.welcomeMessage(name: user.name))
        }
        
        return parlance.t(.genericWelcomeMessage)
    }
}

extension WelcomeViewController: SignInViewControllerDelegate {
    func didSignIn() {
        sessionsCount += 1
    }
}
