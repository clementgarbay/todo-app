//
//  ToDoListTableViewController.swift
//  TodoApp
//
//  Created by Clément GARBAY on 26/11/2015.
//  Copyright © 2015 Clément GARBAY. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoItems: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell")!
        
        let item: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        cell.textLabel!.text = item.itemName
        cell.accessoryType = (item.completed) ? .Checkmark : .None

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
        let tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
            
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadInitialItems() {
        let item1 = ToDoItem(name: "Do his homeworks")
        self.toDoItems.addObject(item1)
        let item2 = ToDoItem(name: "Learn Swift")
        self.toDoItems.addObject(item2)
    }
    
    @IBAction func saveNewTask(segue: UIStoryboardSegue) {
        let source: AddToDoViewController = segue.sourceViewController as! AddToDoViewController
        
        if let item: ToDoItem = source.toDoItem {
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func cancelToTableViewController(segue: UIStoryboardSegue) {}

}
