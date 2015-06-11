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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureLabels()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        
        self.demographicLabel.textAlignment = .Center
        self.demographicLabel.textColor = UIColor.whiteColor()
        self.demographicLabel.font = UIFont.font(BYFontType.Light, fontSize: 40)
        
        self.ageRangeLabel.textAlignment = .Center
        self.ageRangeLabel.textColor = UIColor.whiteColor()
        self.ageRangeLabel.font = UIFont.font(BYFontType.Light, fontSize: 20)
    }
    
}
