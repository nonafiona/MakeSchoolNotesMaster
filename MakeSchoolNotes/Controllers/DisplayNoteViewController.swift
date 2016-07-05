//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    var note: Note?
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        if let identifier = segue.identifier{
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                // if note exists, update title and content
                if let note = note {
                    // 1 
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    RealmHelper.updateNote(note, newNote: newNote)
                    
                    // 2 
                    listNotesTableViewController.tableView.reloadData()
                    
                } else {
                    // 3
                    let note = Note()
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    note.modificationTime = NSDate()
                    
                    RealmHelper.addNote(note)
                    
                }
                listNotesTableViewController.notes = RealmHelper.retrieveNotes()
                
            }
        }
    }
    
    


}
