//
//  CustomCell.swift
//  InputForm
//
//  Created by Kentarou on 2017/03/11.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var person: Person? {
        didSet {
            guard let person = person else { return }
            
            nameLabel.text = person.name
            ageLabel.text = String(person.age)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
