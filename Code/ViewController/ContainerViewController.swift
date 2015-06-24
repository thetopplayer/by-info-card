//
//  ContainerViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/12/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var swipeTipLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    var submission: BYSubmission?
    weak var delegate: BYSubmissionFinishing?
    var pages = [UIViewController]()
    
    let defaultSwipeLabelAlpha: CGFloat = 0.7
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configurePages()
        configureScrollView()
        configureKeyboardListeners()
        configureSwipeRightLabel()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        // Configure scrollview
        self.scrollView.frame = self.view.frame
        self.scrollView.contentSize.width = CGFloat(self.pages.count) * self.view.width
        self.scrollView.contentSize.height = self.view.height
        
        // Set position of all pages in scrollview
        for i in 0..<self.pages.count {
            pages[i].view.frame = CGRectMake(CGFloat(i) * self.view.width, 0, self.view.width, self.view.height)
        }
    }
    
    // MARK: - Configure
    
    private func configureSwipeRightLabel() {
        self.swipeTipLabel.text = "Swipe to continue"
        self.swipeTipLabel.textColor = UIColor.whiteColor()
        self.swipeTipLabel.font = UIFont.font(BYFontType.Light, fontSize: 20)
        self.swipeTipLabel.alpha = defaultSwipeLabelAlpha
    }
    
    private func configureScrollView() {
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
        self.scrollView.backgroundColor = UIColor.clearColor()
        
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = 0
        
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    private func configurePages() {
        
        // Initialize pages
        self.pages.append(self.pageViewController("InterestsVC"))
        self.pages.append(self.pageViewController("ProfileVC"))
        self.pages.append(self.pageViewController("AgeGroupVC"))
        
        // Add pages as child view controllers
        for i in 0..<self.pages.count {
            let childVC = self.pages[i]
            self.addChildViewController(childVC)
            self.scrollView.addSubview(childVC.view)
            childVC.didMoveToParentViewController(self)
        }
    }
    
    private func pageViewController(identifier: String) -> BasePageViewController {
        return self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! BasePageViewController
    }
    
    @IBAction func presentOptions(sender: UIView) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Exit", style: UIAlertActionStyle.Destructive) { (action) -> Void in
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
                self.view.alpha = 0
            }, completion: { (finished) -> Void in
                self.willMoveToParentViewController(nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
                self.delegate?.returnToWelcomeScreen()
            })
        }

        alertController.addAction(cancelAction)
        alertController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popoverController = alertController.popoverPresentationController
        popoverController?.sourceView = sender
        popoverController?.sourceRect = sender.bounds
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetX: CGFloat = scrollView.contentOffset.x
        
        // Get exact page position (e.g. 2.5)
        let positionX: CGFloat = offsetX / self.view.width
        
        // Calculate left and right page index
        let leftPageIndex: Int = Int(floor(positionX))
        let rightPageIndex: Int = leftPageIndex + 1
        
        // Calculate offset for left and right pages
        let leftOffset: CGFloat = positionX - floor(positionX)
        let rightOffset: CGFloat = 1 - leftOffset
        
        // Notify left page about scroll
        if leftPageIndex >= 0 {
            (self.pages[leftPageIndex] as! EKPageScrolling).onScrollWithPageOnLeft(leftOffset)
        }
        
        // Notify right page about scroll
        if rightPageIndex < self.pages.count {
            (self.pages[rightPageIndex] as! EKPageScrolling).onScrollWithPageOnRight(rightOffset)
        }
        
        // Update page control
        self.pageControl.currentPage = lround(Double(positionX))
        
        self.swipeTipLabel.alpha = defaultSwipeLabelAlpha - positionX
    }
    
    // MARK: - Submission
    
    func submitForm() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            let scale: CGFloat = 1.2;
            self.view.transform = CGAffineTransformMakeScale(scale, scale)
            self.view.alpha = 0
            }, completion: { (finished) -> Void in
                self.willMoveToParentViewController(nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
                self.delegate?.goToThankYouScreen()
        })
    }
    
    // MARK: - Keyboard Listeners
    
    func configureKeyboardListeners() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardWillShow() {
        self.scrollView.scrollEnabled = false
    }
    
    func keyboardDidHide() {
        self.scrollView.scrollEnabled = true
    }
}
