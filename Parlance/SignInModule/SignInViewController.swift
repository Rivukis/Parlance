//
//  SignInViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.delegate = self
            nameTextField.placeholder = SignInParlance.t(.namePlaceholder)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
            passwordTextField.placeholder = SignInParlance.t(.passwordPlaceholder)
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            signInButton.setTitle(SignInParlance.t(.signInButtonText), for: .normal)
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.layer.cornerRadius = 5
            cancelButton.setTitle(SignInParlance.t(.cancelButtonText), for: .normal)
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    
    @IBAction func signInTapped(_ sender: Any) {
        guard let name = nameTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if !name.isEmpty && password == "password" {
            User.currentUser = User(name: name)
            
            dismiss()
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss()
    }
    
    // MARK: Helper
    
    func dismiss() {
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        dismiss(animated: true)
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            signInTapped(self)
        }
        
        return false
    }
}
