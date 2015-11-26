//
//  ToDoItem.swift
//  TodoApp
//
//  Created by Clément GARBAY on 26/11/2015.
//  Copyright © 2015 Clément GARBAY. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {

    var itemName: String = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name: String) {
        self.itemName = name
    }
    
}
