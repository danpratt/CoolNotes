//
//  Notebook+CoreDataClass.swift
//  CoolNotes
//
//  Created by Daniel Pratt on 4/10/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData

@objc(Notebook)
public class Notebook: NSManagedObject {

    convenience init (name: String, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Notebook", in: context) {
            self.init(entity: ent, insertInto: context)
            self.name = name
            self.creationDate = NSDate()
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
    
}
