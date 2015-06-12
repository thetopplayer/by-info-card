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
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configurePages()
        configureScrollView()
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
    
    private func configureScrollView() {
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
        self.scrollView.backgroundColor = UIColor.clearColor()
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
            (pages[leftPageIndex] as! EKPageScrolling).onScrollWithPageOnLeft(leftOffset)
        }
        
        // Notify right page about scroll
        if rightPageIndex < self.pages.count {
            (pages[rightPageIndex] as! EKPageScrolling).onScrollWithPageOnRight(rightOffset)
        }
    }
}

