//
//  DetailTableViewController.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 5/1/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var hubName: String = ""
    var hub = [String]()
    var attachedDevices = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        hub.append(hubName)
        
        attachedDevices = ["Garage Door 1", "Living Room Light", "Garage Door 2"]
        // print("\(hubName)")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationItem.title = hubName
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav-bar-bkgd"), forBarMetrics: UIBarMetrics.Default)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let screenWidth = screenSize.width
        
        //Navigation bar customization
        if screenWidth == 320 {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 22))!]
        }
        
        
        // let backButton = UIBarButtonItem(title: "Home/Return or nohing", style: .Plain, target: nil, action: nil)
        // navigationItem.backBarButtonItem = backButton
        // self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backIcon")
        // self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backIcon")
        // self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return hub.count
        } else {
            return attachedDevices.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Devices"
        } else {
            return ""
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> CustomTableCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EntryCell", forIndexPath: indexPath) as! CustomTableCell

        if indexPath.section == 0 {
            
            cell.label2.text = hub[indexPath.row]
            
        } else {
            
            cell.label2.text = attachedDevices[indexPath.row]
        }

        return cell
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

}
