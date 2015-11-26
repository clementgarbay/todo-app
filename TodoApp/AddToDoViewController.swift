//
//  AddToDoViewController.swift
//  TodoApp
//
//  Created by Clément GARBAY on 26/11/2015.
//  Copyright © 2015 Clément GARBAY. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    internal var toDoItem: ToDoItem?
    
    @IBOutlet var textfield : UITextField?
    @IBOutlet var doneButton : UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.doneButton {
            return
        }
        
        if self.textfield!.text!.utf16.count > 0{
            self.toDoItem = ToDoItem(name: self.textfield!.text!)
        }
    }
}
