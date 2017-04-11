//
//  NotesTableViewController.swift
//  CoolNotes
//
//  Created by Daniel Pratt on 4/11/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get note
        let note = fetchedResultsController?.object(at: indexPath) as! Note
        
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        
        // Sync note -> cell
        cell.textLabel?.text = note.text
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier! == "displayNoteDetail" {
            
            if let detailVC = segue.destination as? NoteDetailViewController {
                let indexPath = tableView.indexPathForSelectedRow!
                let note = self.tableView.cellForRow(at: indexPath)
                if let text = note?.textLabel?.text {
                    detailVC.text = text
                }
            }
        }
        
    }

}
