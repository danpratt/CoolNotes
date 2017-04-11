//
//  NoteDetailViewController.swift
//  CoolNotes
//
//  Created by Daniel Pratt on 4/11/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    var text: String = ""
    
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteText.text = text
    }


}
