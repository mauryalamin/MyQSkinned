//
//  OnboardView.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/27/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class OnboardView: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages = [OnboardSingleView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.pagingEnabled = true
        
        let page1 = createAndAddOnboardView("onboard1", titleText: "Smarter is Better", titleLines: 1, descriptionText: "With MyQ, stay connected and control your home – from anywhere, at anytime.")
        let page2 = createAndAddOnboardView("onboard2", titleText: "Always informed", titleLines: 1, descriptionText: "Know if your garage door opens or if you forgot to close it.\r\rHistory reveals detailed event activity for your devices. ")
        let page3 = createAndAddOnboardView("onboard3", titleText: "More than garage door openers", titleLines: 2, descriptionText: "Control of a variety of devices, like remote light controls and switches.\r\rAdd even more devices from our partners with Account Linking.")
        let page4 = createAndAddOnboardView("onboard4", titleText: "Added Security", titleLines: 1, descriptionText: "Rest assured knowing only authorized users can open your garage doors, when you add a pin code to your door opener. ")
        let page5 = createAndAddOnboardView("onboard5", titleText: "Peace of mind in the palm of your hand", titleLines: 2, descriptionText: "Stay connected and in control with MyQ.")
        
        pages = [page1, page2, page3, page4, page5]
        pageControl.numberOfPages = pages.count
        
        let views = ["view": view, "page1": page1.view, "page2": page2.view, "page3": page3.view, "page4": page4.view, "page5": page5.view]
        
        let metrics = ["edgeMargin": 10, "betweenMargin": 20]
        
        let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(verticalContraints)
        
        let horizontalContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-[page4(==view)]-betweenMargin-[page5(==view)]-edgeMargin-|", options: [.AlignAllTop, .AlignAllBottom], metrics: metrics, views: views)
        NSLayoutConstraint.activateConstraints(horizontalContraints)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createAndAddOnboardView(backgroundImageName: String, titleText: String, titleLines: Int, descriptionText: String) -> OnboardSingleView {
        let onboardView = storyboard!.instantiateViewControllerWithIdentifier("OnboardSingleView") as! OnboardSingleView
        onboardView.view.translatesAutoresizingMaskIntoConstraints = false
        onboardView.backgroundImage = UIImage(named: backgroundImageName)
        // onboardView.titleLines = titleLines
        onboardView.titleString = titleText
        onboardView.descriptionString = descriptionText
        
        scrollView.addSubview(onboardView.view)
        
        addChildViewController(onboardView)
        onboardView.didMoveToParentViewController(self)
        
        // print("Background Image: \(onboardView.backgroundImage), Title Text: \(onboardView.titleString), Description Text: \(onboardView.descriptionString)")
        
        return onboardView
    }
    
    @IBAction func dismissView(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

extension OnboardView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControl.currentPage = Int(round(pageFraction))
        
    }
    
}





