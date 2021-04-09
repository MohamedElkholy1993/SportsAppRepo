//
//  TeamCollectionViewCell.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/19/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import SDWebImage

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    
    func fetchTeamImage(imageUrl:String) 
    {
        let url = URL(string: imageUrl )
        self.teamImage.sd_setImage(with: url, completed: nil)
    }

}
