//
//  NotebooksTableViewController.swift
//  CoolNotes
//
//  Created by Daniel Pratt on 4/11/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import CoreData

class NotebooksTableViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the title
        title = "CoolNotes"
        
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Find the notebook
        let nb = fetchedResultsController!.object(at: indexPath) as! Notebook
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotebookCell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = "\(nb.notes!.count) notes"
        
        return cell
    }

}
