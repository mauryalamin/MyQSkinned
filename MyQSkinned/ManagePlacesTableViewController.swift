//
//  ManagePlacesTableViewController.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/27/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class ManagePlacesTableViewController: UITableViewController {
    
    var places = [String]()
    var partnerDevices = [String]()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        places = ["My Home", "Lake House", "Paisley Park"]
        partnerDevices = ["Nest: Home"]
    }
    
    override func viewWillAppear(animated: Bool) {
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
            return places.count
        } else {
            return partnerDevices.count
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MyQ Places"
        } else {
            return "Linked Partner Devices"
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EntryCell", forIndexPath: indexPath) as! CustomTableCell

        if indexPath.section == 0 {
            
            cell.label.text = places[indexPath.row]
            
        } else {
            
            cell.label.text = partnerDevices[indexPath.row]
        }
        
        return cell
    }
    
    @IBAction func menuButton(sender: UIBarButtonItem) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        let font = UIFont(name: "TitilliumWeb-Regular", size: 13)
        header.textLabel?.font = font
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let destinationView = segue.destinationViewController as! DetailTableViewController
        
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            var selectedRow = ""
            
            switch indexPath.section {
            case 0:
                selectedRow = places[indexPath.row]
            default:
                selectedRow = partnerDevices[indexPath.row]
            }
            
            destinationView.hubName = selectedRow
        }
        
        let screenWidth = screenSize.width
        
        //Navigation bar customization
        // let backButton = UIBarButtonItem(title: "\(navigationItem.title!)", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backIcon")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backIcon")
        
        if screenWidth == 320 {
            // Nav Bar Button Item custom font
            backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 16)!], forState: UIControlState.Normal)
        } else {
            // Nav Bar Button Item custom font
            backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 18)!], forState: UIControlState.Normal)
        }
        
        navigationItem.backBarButtonItem = backButton
    }
    

}