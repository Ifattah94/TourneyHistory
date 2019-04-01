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
        //Present main vc
    }
    
    
}
extension LoginViewController: UserSessionAccountCreationDelegate {
    func didCreateAccount(_ userSession: UserSession, user: User) {
    
    }
    
    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error) {
        //Show Error
    }
    
    
}

extension LoginViewController: UserSessionSignInDelegate {
    func didRecieveSignInError(_ usersession: UserSession, error: Error) {
        
    }
    
    func didSignInExistingUser(_ usersession: UserSession, user: User) {
        //Present main VC
    }
    
    
}
