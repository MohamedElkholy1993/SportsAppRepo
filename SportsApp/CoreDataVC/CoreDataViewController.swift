//
//  CoreDataViewController.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import Reachability
import SDWebImage
class CoreDataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var favouriteTableView: UITableView!
    var coreDataManager = CoreDataLayer.shared
    //var favoriteLeague : [LeagueCore] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.storedLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as! CoreDataCustomTableViewCell
        if coreDataManager.storedLeagues.count > indexPath.row{
            cell.leagueTextLabel.text = coreDataManager.storedLeagues[indexPath.row].leagueName
            if coreDataManager.storedLeagues[indexPath.row].leagueBadge != nil{
            cell.badgeImageView.sd_setImage(with: URL(string: coreDataManager.storedLeagues[indexPath.row].leagueBadge!))
            }else{
                cell.badgeImageView.image = UIImage(contentsOfFile: "image")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let check = NetworkReachabilityManager()?.isReachable,check{
            let storyboard = UIStoryboard(name: "Second", bundle: nil)
            if let leagueDetailsVC = storyboard.instantiateViewController(identifier: "LeagueDetailsViewController") as? LeagueDetailsViewController{
                let leagueToView = coreDataManager.storedLeagues[indexPath.row]
                let newLeague = League(leagueID: leagueToView.idLeague, leagueBadge: leagueToView.leagueBadge, leagueName: coreDataManager.storedLeagues[indexPath.row].leagueName, youtubeLink: coreDataManager.storedLeagues[indexPath.row].youtubeLink, sportName: leagueToView.sportName, leagueAlternate: leagueToView.leagueAlternate, isFavourite: leagueToView.isFavourite)
                leagueDetailsVC.leagueToView = newLeague
                //leagueDetailsVC.modalPresentationStyle = .popover
                leagueDetailsVC.modalTransitionStyle = .coverVertical
                
                present(leagueDetailsVC, animated: true)
            }
        }else{
            let alertView = UIAlertController(title: "Sports Application", message: "No Internet Connection", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertView.addAction(action)
            self.present(alertView, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red
        getAllFavouriteLeagues()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllFavouriteLeagues()
    }

 
    // MARK: - Navigation
    func getAllFavouriteLeagues(){
        
        //coreDataManager.storedLeagues
        self.favouriteTableView.reloadData()
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataLayer.shared.deleteFromStorage(at: indexPath.row)
        
        self.favouriteTableView.reloadData()
        
    }
}
