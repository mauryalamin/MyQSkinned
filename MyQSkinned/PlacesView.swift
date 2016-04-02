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
    private let deviceControl = DeviceControl()
    
    var devices = [DeviceControl]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.pagingEnabled = true
        
        let deviceControl1 = DeviceControl()
        let deviceControl2 = DeviceControl()
        let deviceControl3 = DeviceControl()
        
        
        let views = ["scrollView": scrollView, "deviceControl1": deviceControl1, "deviceControl2": deviceControl2, "deviceControl3": deviceControl3]
        
        scrollView.addSubview(deviceControl1)
        scrollView.addSubview(deviceControl2)
        scrollView.addSubview(deviceControl3)
        
        let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[deviceControl1(==scrollView)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(verticalContraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[deviceControl1(==scrollView)][deviceControl2(==scrollView)][deviceControl3(==scrollView)]|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(horizontalConstraints)
        
        // view.addSubview(deviceControl)
        
        /*
        NSLayoutConstraint.activateConstraints([
            
            deviceControl.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor),
            deviceControl.topAnchor.constraintEqualToAnchor(scrollView.topAnchor),
            deviceControl.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor),
            // deviceControl.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
            ])*/
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
