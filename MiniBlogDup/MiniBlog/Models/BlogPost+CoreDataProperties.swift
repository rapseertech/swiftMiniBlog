//
//  BlogPost+CoreDataProperties.swift
//  
//
//  Created by raph on 10/6/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension BlogPost {

    @NSManaged var date: NSDate?
    @NSManaged var content: String?
    @NSManaged var title: String?
    @NSManaged var blogpost_author: Author?

}
