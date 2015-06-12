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
    let selectedCardColor = UIColor(white: 0, alpha: 0.5)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureLabels()
        self.backgroundColor = UIColor.clearColor()
        self.cardView.backgroundColor = defaultCardColor
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.cardView.backgroundColor = selectedCardColor
        } else {
            self.cardView.backgroundColor = defaultCardColor
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            self.cardView.backgroundColor = selectedCardColor
        } else {
            self.cardView.backgroundColor = defaultCardColor
        }
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        
        self.demographicLabel.textAlignment = .Center
        self.demographicLabel.textColor = UIColor.whiteColor()
        self.demographicLabel.font = UIFont.font(BYFontType.Light, fontSize: 30)
        
        self.ageRangeLabel.textAlignment = .Center
        self.ageRangeLabel.textColor = UIColor.whiteColor()
        self.ageRangeLabel.font = UIFont.font(BYFontType.Light, fontSize: 18)
    }
    
}
