//
//  BYAgeTableViewCell.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/11/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BYAgeTableViewCell: UITableViewCell {

    @IBOutlet weak var demographicLabel: UILabel!
    @IBOutlet weak var ageRangeLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    let defaultCardColor = UIColor(white: 0, alpha: 0.2)
    let selectedCardColor = UIColor(white: 0, alpha: 0.6)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureLabels()
        self.backgroundColor = UIColor.clearColor()
        self.cardView.backgroundColor = self.defaultCardColor
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
        
        // Animate selection/deselection of cell
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            let scale: CGFloat = 0.95
            self.cardView.transform = CGAffineTransformMakeScale(scale, scale)
            self.cardView.backgroundColor = selected ?  self.selectedCardColor : self.defaultCardColor
            }, completion: { (finished) -> Void in
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.cardView.transform = CGAffineTransformIdentity
            })
        })
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        self.cardView.backgroundColor = highlighted ? self.selectedCardColor : self.defaultCardColor
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        
        self.demographicLabel.textAlignment = .Center
        self.demographicLabel.textColor = UIColor.whiteColor()
        self.demographicLabel.font = UIFont.font(BYFontType.Normal, fontSize: 26)
        
        self.ageRangeLabel.textAlignment = .Center
        self.ageRangeLabel.textColor = UIColor.whiteColor()
        self.ageRangeLabel.font = UIFont.font(BYFontType.Light, fontSize: 18)
    }
    
}
