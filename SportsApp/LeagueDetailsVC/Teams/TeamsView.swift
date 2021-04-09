//
//  TeamsView.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/20/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit


class TeamsView: UIView {
    
    
    var teamSender:SendTeamProtocol?
    @IBOutlet weak var teamsCollectionView:UICollectionView!
    var teams = [Team](){
        didSet{
            teamsCollectionView.reloadData()
        }
    }
    

}

extension TeamsView : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        teamSender?.sendTeam(team: teams[indexPath.row])
        
    }
}

extension TeamsView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath)
        if let teamCell = cell as? TeamCollectionViewCell{
            teamCell.layer.borderWidth = 5
            teamCell.layer.masksToBounds = false
            teamCell.layer.borderColor = UIColor.white.cgColor
            teamCell.layer.cornerRadius = teamCell.frame.height/2
            teamCell.clipsToBounds = true
            teamCell.fetchTeamImage(imageUrl: teams[indexPath.row].teamBadge!)
            
            
            
        }
        return cell
    }
    
    
}

extension TeamsView : UICollectionViewDelegateFlowLayout{
    
    
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (teamsCollectionView.frame.height/2)+20, height: (teamsCollectionView.frame.height/2)+20)
           return size
       }
    
}
