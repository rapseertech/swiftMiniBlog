//
//  HomeView.swift
//  MiniBlog
//
//  Created by Allister Alambra on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol SignOutDelegate {
    func didTapSignOut(sender: AnyObject)
}

class HomeView: BaseView{
    
    var delegate: SignOutDelegate?
    
    @IBOutlet weak var blogTable: UITableView!
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        if self.delegate != nil && self.delegate?.didTapSignOut != nil{
            self.delegate?.didTapSignOut(sender)
        }
    }
}