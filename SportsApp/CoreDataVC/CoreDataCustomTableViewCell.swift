//
//  CoreDataCustomTableViewCell.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit

class CoreDataCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var badgeImageView: UIImageView!
    
    @IBOutlet weak var leagueTextLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        badgeImageView.layer.cornerRadius = badgeImageView.frame.height/2
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
