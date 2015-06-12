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

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.checkbox.image = UIImage(named: selected ? "CheckboxSelected" : "Checkbox")
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
