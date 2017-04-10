//
//  Note+CoreDataClass.swift
//  CoolNotes
//
//  Created by Daniel Pratt on 4/10/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    
    convenience init(text:String = "New Note", context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Note", in: context) {
            self.init(entity: ent, insertInto: context)
            self.text = text
            self.creationDate = NSDate()
        } else {
            fatalError("Unable to find Entity name!")
        }
    }

}
