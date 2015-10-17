//
//  TableViewController.swift
//  memorable-places
//
//  Created by Jason Shultz on 10/15/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import CoreData

var places = [Dictionary<String,String>()]

var activePlace = -1

let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let context: NSManagedObjectContext = appDel.managedObjectContext

let request = NSFetchRequest(entityName: "Places")


class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let results = try context.executeFetchRequest(request)
//            
//            if (results.count > 0) {
//                
//                for result in results as! [NSManagedObject] {
//                    let title:String = String(result.valueForKey("title")!)
//                    let lat:String = String(result.valueForKey("lat")!)
//                    let lon:String = String(result.valueForKey("lon")!)
//                    places.append(["name":"\(title)","lat":"\(lat)","lon":"\(lon)"])
//                }
//            }
//        } catch {
//            print("something went wrong")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = places[indexPath.row]["name"]

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        activePlace = indexPath.row
        
        return indexPath
    }
    
    override func viewWillAppear(animated: Bool) {
        
        places.removeAll()
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if (results.count > 0) {
                
                for result in results as! [NSManagedObject] {
                    let title:String = String(result.valueForKey("title")!)
                    let lat:String = String(result.valueForKey("lat")!)
                    let lon:String = String(result.valueForKey("lon")!)
                    places.append(["name":"\(title)","lat":"\(lat)","lon":"\(lon)"])
                }
            }
        } catch {
            print("something went wrong")
        }
        
        if places.count == 1 {
            places.removeAtIndex(0)
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
        }
        
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            places.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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

}