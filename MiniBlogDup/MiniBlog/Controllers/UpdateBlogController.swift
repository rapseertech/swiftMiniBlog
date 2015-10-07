//
//  UpdateBlogController.swift
//  MiniBlog
//
//  Created by raph on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UpdateBlogController: BaseController {
    
    var updateBlogView: AddBlogView?
    var blogPostTitle: String?
    var blogPostContent: String?
    var blogAuthor: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Targeted Xibs
        self.loadXibName("AddBlogView")
        self.updateBlogView = (self.view as! AddBlogView)
        self.updateBlogView?.blogTitleTextField.text = blogPostTitle
        self.updateBlogView?.blogPostTextView.text = blogPostContent
        
        if Session.sharedInstance.sessionName != blogAuthor {
            self.updateBlogView?.blogTitleTextField.enabled = false
            self.updateBlogView?.blogPostTextView.editable = false
        }
        
        // Initialize UI Elements
        self.initializeNavigationBar()
        
    }
    
    // MARK: CoreData Methods
    func updateBlog(){
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        let entity =  NSEntityDescription.entityForName("BlogPost",
//            inManagedObjectContext:managedContext)
//        let blogPost:BlogPost = BlogPost(entity: entity!,
//            insertIntoManagedObjectContext: managedContext)
//        blogPost.title = self.addBlogView?.blogTitleTextField.text
//        blogPost.content = self.addBlogView?.blogPostTextView.text
//        blogPost.date = NSDate()
//        
//        let authEntity =  NSEntityDescription.entityForName("Author",
//            inManagedObjectContext:managedContext)
//        let auth:Author = Author(entity: authEntity!,
//            insertIntoManagedObjectContext: managedContext)
//        auth.name = readFromPlist("Default Author")
//        
//        blogPost.blogpost_author = auth
//        
//        
//        do {
//            try managedContext.save()
//            self.navigationController?.popViewControllerAnimated(true)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "BlogPost")
        fetchRequest.predicate = NSPredicate(format: "title = %@", blogPostTitle!)
        
        do {
            let fetchResults = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [BlogPost]
                if fetchResults!.count != 0{
                    
                    let managedObject = fetchResults![0]
                    managedObject.setValue(self.updateBlogView?.blogTitleTextField.text, forKey: "title")
                    managedObject.setValue(self.updateBlogView?.blogPostTextView.text, forKey: "content")
                    
                    try managedContext.save()
                }
        }
        catch let error as NSError {
            print("\(error)")
        }
        self.performSegueWithIdentifier("UpdateToHomeSegue", sender: self)
    }
    
    // MARK: Controller Initializers
    
    func initializeNavigationBar(){
        
        let addBlogButtonItem = UIBarButtonItem(title: "Update", style: .Plain, target: self, action: Selector("updateBlog"))
        
        self.navigationItem.rightBarButtonItem = addBlogButtonItem
        
        if Session.sharedInstance.sessionName != blogAuthor {
            self.navigationItem.rightBarButtonItem?.enabled = false
        }
        
    }
}
