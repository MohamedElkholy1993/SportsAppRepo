//
//  TeamDetailsView.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class TeamDetailsView: UIView {
    
    
    @IBOutlet weak var teamBadgeImage: UIImageView!
    
    @IBOutlet weak var teamJerseyImage: UIImageView!
   
    @IBOutlet weak var staduimImage: UIImageView!
    
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var staduimIndicatorContainerView: UIView!
    
    @IBOutlet weak var badgeIndicatorContainerView: UIView!
    
    @IBOutlet weak var jerseyIndicatorContainerView: UIView!
    var staduimActivityIndicator : NVActivityIndicatorView!
    var badgeActivityIndicator : NVActivityIndicatorView!
    var jerseyActivityIndicator : NVActivityIndicatorView!
    
    func fetchTeamImagesAndDescription(team:Team){
        
        activityIndicatorStartLoading()
        
        if let urlStr = team.teamBadge{
            if let badgeurl = URL(string: urlStr ){
                teamBadgeImage.sd_setImage(with: badgeurl) { [weak self](image, error, cacheType, url) in
                    guard let weakSelf = self else{return}
                    weakSelf.badgeActivityIndicatorStopLoading()
                }
            }
        }else{
            teamBadgeImage.image = UIImage(named:"defaultImage")
        }
        
        if let urlStr = team.teamJersey{
            if let jerseyurl = URL(string: urlStr ){
                teamJerseyImage.sd_setImage(with: jerseyurl) { [weak self](image, error, cacheType, url) in
                    guard let weakSelf = self else{return}
                    weakSelf.jerseyActivityIndicatorStopLoading()
                }
            }
        }else{
            teamBadgeImage.image = UIImage(named:"defaultImage")
        }
        
        if let urlStr = team.stadiumThumbnail{
            if let staduimurl = URL(string: urlStr ){
                staduimImage.sd_setImage(with: staduimurl) { [weak self](image, error, cacheType, url) in
                    guard let weakSelf = self else{return}
                    weakSelf.staduimActivityIndicatorStopLoading()
                }
            }
        }else{
            teamBadgeImage.image = UIImage(named:"defaultImage")
        }
        
        staduimImage.layer.cornerRadius = 25
        
        if let teamDescription = team.Description{
            descriptionText.text = teamDescription
        }else{
            descriptionText.text = ""
        }
        
        
    }
    
    fileprivate func activityIndicatorStartLoading() {
        let xCenterForStaduim = staduimIndicatorContainerView.center.x
        let yCenterForStaduim = staduimIndicatorContainerView.center.y
        
        let xCenterForBadge = badgeIndicatorContainerView.center.x
        let yCenterForBadge = badgeIndicatorContainerView.center.y
        
        let xCenterForJersey = jerseyIndicatorContainerView.center.x
        let yCenterForJersey = jerseyIndicatorContainerView.center.y
        
        let staduimFrame = CGRect(x: xCenterForStaduim-40, y: yCenterForStaduim-463.5, width: 45, height: 45)
        let badgeFrame = CGRect(x: xCenterForBadge-45, y: yCenterForBadge-45, width: 45, height: 45)
        let jerseyFrame = CGRect(x: xCenterForJersey-250, y: yCenterForJersey-45, width: 45, height: 45)
        
        staduimActivityIndicator = NVActivityIndicatorView(frame: staduimFrame)
        badgeActivityIndicator = NVActivityIndicatorView(frame: badgeFrame)
        jerseyActivityIndicator = NVActivityIndicatorView(frame: jerseyFrame)

        staduimActivityIndicator.type = .ballScaleMultiple // add your type
        staduimActivityIndicator.color = UIColor.white // add your color
        
        staduimIndicatorContainerView.addSubview(staduimActivityIndicator)
        badgeIndicatorContainerView.addSubview(badgeActivityIndicator)
        jerseyIndicatorContainerView.addSubview(jerseyActivityIndicator)

        staduimActivityIndicator.startAnimating()
        badgeActivityIndicator.startAnimating()
        jerseyActivityIndicator.startAnimating()
    }
    
    fileprivate func staduimActivityIndicatorStopLoading() {
        staduimActivityIndicator.stopAnimating()
       
    }
    
    fileprivate func badgeActivityIndicatorStopLoading() {
        badgeActivityIndicator.stopAnimating()
       
    }
    
    fileprivate func jerseyActivityIndicatorStopLoading() {
        jerseyActivityIndicator.stopAnimating()
       
    }
}
