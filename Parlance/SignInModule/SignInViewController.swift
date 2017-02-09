//
//  SignInViewController.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    func didSignIn()
}

class SignInViewController: UIViewController {
    let parlance = SignInParlance()
    weak var delegate: SignInViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.delegate = self
            nameTextField.placeholder = parlance.t(.namePlaceholder)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
            passwordTextField.placeholder = parlance.t(.passwordPlaceholder)
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.layer.cornerRadius = 5
            signInButton.setTitle(parlance.t(.signInButtonText), for: .normal)
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.layer.cornerRadius = 5
            cancelButton.setTitle(parlance.t(.cancelButtonText), for: .normal)
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
            delegate?.didSignIn()
            
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
