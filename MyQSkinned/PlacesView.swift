//
//  PlacesView.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/30/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class PlacesView: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let deviceControl = DeviceControl()
    var devicesArray = [DeviceControl]()
    
    private let addNewDevice = AddNewDevice()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var devices = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.pagingEnabled = true
        
        // TO DO: After JSON file import, new method would loop through each JSON object and create device instances on the fly
        
        
        // if UserData.userData.hubs.count != 0 {
        
        if devices {
            
            let deviceControl1 = configureAndAddDevice("GDO", placeName: "LAKE HOME", deviceName: "Garage Door", deviceIcon: "gdo-closed")
            let deviceControl2 = configureAndAddDevice("LIGHT", placeName: "MY HOME", deviceName: "Front Light", deviceIcon: "light-on")
            let deviceControl3 = configureAndAddDevice("THERMOSTAT", placeName: "MY HOME", deviceName: "Thermostat", deviceIcon: "therm-home")
            
            let views = ["scrollView": scrollView, "deviceControl1": deviceControl1, "deviceControl2": deviceControl2, "deviceControl3": deviceControl3]
            
            let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[deviceControl1(==scrollView)]|", options: [], metrics: nil, views: views)
            NSLayoutConstraint.activateConstraints(verticalContraints)
            
            let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[deviceControl1(==scrollView)][deviceControl2(==scrollView)][deviceControl3(==scrollView)]|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
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
    
    private func configureAndAddDevice(type: String, placeName: String, deviceName: String, deviceIcon: String) -> DeviceControl {
        
        let deviceControl = DeviceControl()
        
        deviceControl.translatesAutoresizingMaskIntoConstraints = false
        
        deviceControl.placeText = placeName
        deviceControl.deviceText = deviceName
        deviceControl.deviceIconImage = UIImage(named: deviceIcon)
        deviceControl.statusText = "OPEN FOR 13 MINUTES"
        
        devicesArray.append(deviceControl)
        
        scrollView.addSubview(deviceControl)
        
        return deviceControl
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func addTapped(sender: UIControl) {
        
        print("Tapped")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension PlacesView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControl.currentPage = Int(round(pageFraction))
        
    }
    
}












