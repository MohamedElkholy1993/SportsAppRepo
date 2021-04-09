//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by Mina Hany on 3/26/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLeagueLabel: UILabel!
    @IBOutlet weak var tubeImageView: UIButton!
    
    @IBOutlet weak var badgeViewCell: UIImageView!
    var linkToGo: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        badgeViewCell.layer.cornerRadius = badgeViewCell.frame.height/2
    }

    @IBAction func touchYoutubeBtn(_ sender: Any) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
