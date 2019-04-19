//
//  LoginViewController.swift
//  tourneyHistory
//
//  Created by C4Q on 3/19/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var loginView: LoginView!
    
    private var usersession: UserSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionAccountDelegate = self
        usersession.usersessionSignInDelegate = self

    }
}
extension LoginViewController: LoginViewDelegate {
    func didSelectLoginButton(_ loginView: LoginView, accountLoginState: AccountLoginState) {
        guard let email = loginView.emailTextField.text,
            let password = loginView.passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty else {
                showAlert(title: "Missing Required Fields", message: "Email and Password Required", actionTitle: "Try Again")
                return
        }
        switch accountLoginState {
        case .newAccount:
            usersession.createNewAccount(email: email, password: password)
        case .existingAccount:
            usersession.signInExistingUser(email: email, password: password)
        }
    }
    
    
}
extension LoginViewController: UserSessionAccountCreationDelegate {
    func didCreateAccount(_ userSession: UserSession, user: User) {
        //present account creation VC
        let storyBoard = UIStoryboard.init(name: "AccountCreation", bundle: nil)
        let accountCreationVC =  storyBoard.instantiateViewController(withIdentifier: "DefaultGameSelectionViewController") as! DefaultGameSelectionViewController
        present(accountCreationVC, animated: true, completion: nil)
        
    
    }
    
    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error) {
        showAlert(title: "ERROR", message: "Could not create account", actionTitle: "OK")
    }
    
    
}

extension LoginViewController: UserSessionSignInDelegate {
    func didRecieveSignInError(_ usersession: UserSession, error: Error) {
        showAlert(title: "Sign In Error", message: error.localizedDescription, actionTitle: "Try Again")
        
    }
    
    func didSignInExistingUser(_ usersession: UserSession, user: User) {
        //present main VC
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        present(homeVC, animated: true, completion: nil)
    
    }
    
    
}
