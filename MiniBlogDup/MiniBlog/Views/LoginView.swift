//
//  LoginView.swift
//  MiniBlog
//
//  Created by raph on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol SignInDelegate {
    func didTapSignOut(sender: AnyObject)
}

class LoginView: BaseView {
    
    var delegate: SignInDelegate?
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: GIDSignInButton!
    @IBAction func didTapSignOut(sender: AnyObject) {
        if self.delegate != nil && self.delegate?.didTapSignOut != nil{
            self.delegate?.didTapSignOut(sender)
        }
    }
    
    
    
}
