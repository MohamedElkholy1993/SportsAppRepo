//
//  LatestResultsView.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/20/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit

class LatestResultsView: UIView{
    @IBOutlet weak var resultsCollectionView:UICollectionView!
    var results = [Results](){
        didSet{
            resultsCollectionView.reloadData()
        }
    }
}

extension LatestResultsView : UICollectionViewDelegate{
    
}

extension LatestResultsView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath)
        if let resultCell = cell as? ResultCollectionViewCell{
            resultCell.layer.cornerRadius = 10
            resultCell.layer.borderColor = UIColor.white.cgColor
            resultCell.layer.borderWidth = 2
            
            if let homeTeam = results[indexPath.row].homeTeam{
                if let awayTeam = results[indexPath.row].awayTeam{
                    resultCell.teamVsTeamLabel.text = homeTeam + " VS " + awayTeam
                }else{
                    
                }
            }else{
                resultCell.teamVsTeamLabel.text = ""
            }
            
            if let homeScore = results[indexPath.row].homeTeamScore{
                if let awayScore = results[indexPath.row].awayTeamScore{
                    resultCell.scoreLabel.text = homeScore + " - " + awayScore
                }else{
                    
                }
            }else{
                resultCell.scoreLabel.text = ""
            }
            
            resultCell.dateLabel.text = results[indexPath.row].date
            resultCell.timeLabel.text = results[indexPath.row].time
            
        }
        return cell
    }
}

extension LatestResultsView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width/2 + 48, height: self.frame.height - 48)
        return size
    }
}

