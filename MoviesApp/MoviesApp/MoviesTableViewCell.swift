//
//  MoviesTableViewCell.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/7/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var filmRate: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var filmName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
