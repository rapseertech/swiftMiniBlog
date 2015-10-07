//
//  AddBlogController.swift
//  MiniBlog
//
//  Created by Allister Alambra on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddBlogController: BaseController{
    
    var addBlogView: AddBlogView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Targeted Xibs
        self.loadXibName("AddBlogView")
        self.addBlogView = (self.view as! AddBlogView)
        
        // Initialize UI Elements
        self.initializeNavigationBar()
        
    }
    
    // MARK: CoreData Methods
    func postBlog(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("BlogPost",
            inManagedObjectContext:managedContext)
        let blogPost:BlogPost = BlogPost(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        blogPost.title = self.addBlogView?.blogTitleTextField.text
        blogPost.content = self.addBlogView?.blogPostTextView.text
        blogPost.date = NSDate()
        
        let authEntity =  NSEntityDescription.entityForName("Author",
            inManagedObjectContext:managedContext)
        let auth:Author = Author(entity: authEntity!,
            insertIntoManagedObjectContext: managedContext)
        auth.name = Session.sharedInstance.sessionName
        
        blogPost.blogpost_author = auth
        
        
        do {
            try managedContext.save()
            self.navigationController?.popViewControllerAnimated(true)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    // MARK: Controller Initializers
    
    func initializeNavigationBar(){
        
        let addBlogButtonItem = UIBarButtonItem(title: "Post", style: .Plain, target: self, action: Selector("postBlog"))
        
        self.navigationItem.rightBarButtonItem = addBlogButtonItem
        
    }
    
}