//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Fiona Carty on 7/4/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate ()
}