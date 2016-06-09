//
//  PlacesView.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/30/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class PlacesView: UIViewController {
    
    // MARK: - Storyboard Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Class Properties
    var currentHubs = UserData.userData.hubs
    var devicesArray = [DeviceControl]()
    private let addNewDevice = AddNewDevice()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.pagingEnabled = true
        
        var views: [String: UIView] = [ : ]
        views["scrollView"] = scrollView
        
        var deviceViews: [String: UIView] = [ : ]
        
        if currentHubs.count != 0 {
            
            var i = 0
            
            for hub in currentHubs {
                for accessory in hub.accessories {
                    // print("device: \(accessory.type!)")
                    
                    let device = configureAndAddDevice(accessory.type!, placeName: hub.name!, deviceName: accessory.name!, deviceIcon: accessory.icon!)
                    // print("Place Name: \(hub.name!), Device Name: \(accessory.name!)")
                    views ["deviceControl\(i)"] = device
                    deviceViews ["deviceControl\(i)"] = device
                    i += 1
                }
            }
            
            let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[deviceControl0(==scrollView)]|", options: [], metrics: nil, views: views)
            NSLayoutConstraint.activateConstraints(verticalContraints)
            
            var horizontalString = "H:|"
            
            for key in deviceViews.keys {
                let stringPortion = "[\(key)(==scrollView)]"
                horizontalString += stringPortion
            }
            
            horizontalString += "|"
            
            pageControl.numberOfPages = devicesArray.count
            
            let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(horizontalString, options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
            NSLayoutConstraint.activateConstraints(horizontalConstraints)
        } else {
            
            addNewDevice.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(addNewDevice)
            addNewDevice.addTarget(self, action: #selector(addTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            NSLayoutConstraint.activateConstraints([
                addNewDevice.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.7),
                addNewDevice.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor),
                addNewDevice.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, constant: 20),
                
                ])
        }
    }
    
    // MARK: - Button Actions
    @IBAction func addNewItem(sender: UIBarButtonItem) {
        let actionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let newDevice = UIAlertAction(title: "Add a Device", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Add Device")
        })
        let newAlert = UIAlertAction(title: "Add an Alert", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Add Alert")
        })
        let newSchedule = UIAlertAction(title: "Add a Scheduled Event", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Add Event")
        })
        let cancelNew = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        actionMenu.addAction(newDevice)
        actionMenu.addAction(newAlert)
        actionMenu.addAction(newSchedule)
        actionMenu.addAction(cancelNew)
        
        self.presentViewController(actionMenu, animated: true, completion: nil)
    }
    
    @IBAction func menuButton(sender: UIBarButtonItem) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    func addTapped(sender: UIControl) {
        print("Tapped")
    }
    
    // MARK: - Configuration Methods
    private func configureAndAddDevice(type: String, placeName: String, deviceName: String, deviceIcon: String) -> DeviceControl {
        
        let deviceControl = DeviceControl()
        
        deviceControl.translatesAutoresizingMaskIntoConstraints = false
        
        deviceControl.placeText = placeName
        deviceControl.deviceText = deviceName
        deviceControl.deviceIconImage = UIImage(named: deviceIcon)
        deviceControl.statusText = "OPEN FOR 13 MINUTES"
        deviceControl.addTarget(self, action: #selector(PlacesView.controlTapped(_:)), forControlEvents: .TouchUpInside)
        devicesArray.append(deviceControl)
        
        scrollView.addSubview(deviceControl)
        return deviceControl
    }
    
    func controlTapped(sender: DeviceControl!) {
        
        print("\(sender.deviceText!) Tapped")
        
    }
    
    // MARK: - Custom Visuals
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // self.navigationController?.navigationBarHidden = true
        
        let screenWidth = screenSize.width
        
        // Set Nav Bar Invisible
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //Navigation bar customization
        if screenWidth == 320 {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 22))!]
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - House Cleaning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: - Extensions
extension PlacesView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControl.currentPage = Int(round(pageFraction))
        
    }
    
}












