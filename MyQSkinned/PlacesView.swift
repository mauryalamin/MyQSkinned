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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.pagingEnabled = true
        
        // TO DO: After JSON file import, new method would loop through each JSON object and create device instances on the fly
        let deviceControl1 = configureAndAddDevice("GDO", placeName: "LAKE HOME", deviceName: "Garage Door", deviceIcon: "gdo-closed")
        let deviceControl2 = configureAndAddDevice("LIGHT", placeName: "MY HOME", deviceName: "Front Light", deviceIcon: "light-on")
        let deviceControl3 = configureAndAddDevice("THERMOSTAT", placeName: "MY HOME", deviceName: "Thermostat", deviceIcon: "therm-home")
        
        let views = ["scrollView": scrollView, "deviceControl1": deviceControl1, "deviceControl2": deviceControl2, "deviceControl3": deviceControl3]
        
        let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[deviceControl1(==scrollView)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(verticalContraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[deviceControl1(==scrollView)][deviceControl2(==scrollView)][deviceControl3(==scrollView)]|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(horizontalConstraints)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
}


extension PlacesView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControl.currentPage = Int(round(pageFraction))
        
    }
    
}












