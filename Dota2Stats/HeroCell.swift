//
//  HeroCell.swift
//  Dota2Stats
//
//  Created by Kun Huang on 11/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
