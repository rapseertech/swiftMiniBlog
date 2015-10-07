//
//  Author+CoreDataProperties.swift
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

extension Author {

    @NSManaged var name: String?
    @NSManaged var author_blogpost: NSSet?

}
