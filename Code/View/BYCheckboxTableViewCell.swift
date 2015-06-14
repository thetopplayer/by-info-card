//
//  BYCheckboxTableViewCell.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/11/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BYCheckboxTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkbox: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()
        self.configureLabel()
        self.configureCheckbox()
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            self.checkbox.alpha = 0.6
        } else {
            self.checkbox.alpha = 1.0
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
        
        // Set checkbox image
        self.checkbox.image = UIImage(named: selected ? "CheckboxSelected" : "Checkbox")

        // Animate selection/deselection of checkbox
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            let scale: CGFloat = selected ? 1.1 : 0.9
            self.checkbox.transform = CGAffineTransformMakeScale(scale, scale)
        }, completion: { (finished) -> Void in
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.checkbox.transform = CGAffineTransformIdentity
            })
        })
    }
    
    func configureLabel() {
        self.descriptionLabel.textColor = UIColor.whiteColor()
        self.descriptionLabel.font = UIFont.font(BYFontType.Light, fontSize: 30)
    }
    
    func configureCheckbox() {
        self.checkbox.image = UIImage(named: self.selected ? "CheckboxSelected" : "Checkbox")
        self.checkbox.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
}
