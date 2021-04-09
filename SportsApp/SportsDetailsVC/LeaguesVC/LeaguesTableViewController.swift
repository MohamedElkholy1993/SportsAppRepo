//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Mina Hany on 3/26/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import SVProgressHUD
class LeaguesTableViewController: UITableViewController {
    var id : String!
    var nameSport : String!
    
    var leaguesArr : [League] = []{
        didSet{
            for league in self.leaguesArr {
                
                callApiToGetDetailsLeague(id: (league.leagueID)!)
            }
            
    }
    }
    
    var leaguesMirge : [League] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = nameSport
        self.navigationController?.navigationBar.backgroundColor = .red
        callAllSportsLeaguesAPI()
        leagueTableView.reloadData()
    }
    @IBOutlet var leagueTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if leaguesArr != nil {
            return leaguesArr.count
        }
        return 0
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBorad = UIStoryboard(name: "Second", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.leagueToView = leaguesMirge[indexPath.row]
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        if leaguesMirge.count > indexPath.row{
            cell.titleLeagueLabel.text = leaguesMirge[indexPath.row].leagueName
            
            if leaguesMirge[indexPath.row].leagueBadge != nil{
            cell.badgeViewCell.sd_setImage(with: URL(string: leaguesMirge[indexPath.row].leagueBadge!))
            }else {
                cell.badgeViewCell.image = UIImage(contentsOfFile: "image2")
            }
            cell.tubeImageView.tag = indexPath.row
            cell.tubeImageView.addTarget(self, action: #selector(cellButtonAction(sender:)), for: .touchUpInside)
            
        }
        
        
        // Configure the cell...

        return cell
    }
    
    @objc func cellButtonAction(sender: UIButton){
        
        let vc = self.storyboard?.instantiateViewController(identifier: "YouTubeViewController") as! YouTubeViewController
        vc.linkYoutube = leaguesMirge[sender.tag].youtubeLink
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK : - To HIT API
    
    func callAllSportsLeaguesAPI(){
        startLoading()
        NetworkLayer.shared.getDataFromAPI(api: "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php") { [weak self](data, error) in
            
            let weakSelf = self
            var fetchedLeagues : [League] = []
            if let dataDictionary = data as? [String:Any]{
                if let leaguesArray = dataDictionary["leagues"] as? [Dictionary<String,Any>]{
                    for league in leaguesArray{
                        var newLeague = League()
                        if league["strSport"] as? String == (weakSelf?.nameSport)!{
                            newLeague.leagueName = league["strLeague"] as? String
                            newLeague.leagueBadge = league["strBadge"] as? String
                            newLeague.leagueID = league["idLeague"] as?
                            String
                            
                            fetchedLeagues.append(newLeague)
                            
                        }
                        //     print(newLeague?.strSport)
                    }
                    weakSelf?.leaguesArr = fetchedLeagues
                    
                }
            }
            // SVProgressHUD.dismiss()
            
            self!.leagueTableView.reloadData()
            
        }
        
        
    }
    var fetchedLeaguesDetails : [League] = []
    func callApiToGetDetailsLeague (id :String) {
        NetworkLayer.shared.getDataFromAPI(api: "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(id)") { [weak self](data, error) in
            
            let weakSelf = self
            
            if let dataDictionary = data as? [String:Any]{
                if let leaguesDetailsArray = dataDictionary["leagues"] as? [Dictionary<String,Any>]{
                    
                    var newLeagueDetail = League()
                    
                    newLeagueDetail.leagueName = leaguesDetailsArray[0]["strLeague"] as? String
                    
                    newLeagueDetail.leagueBadge = leaguesDetailsArray[0]["strBadge"] as?
                    String
                    newLeagueDetail.youtubeLink = leaguesDetailsArray[0]["strYoutube"] as? String
                    newLeagueDetail.leagueID = leaguesDetailsArray[0]["idLeague"] as? String
                    weakSelf?.fetchedLeaguesDetails.append(newLeagueDetail)
                    
                    
                    weakSelf?.leaguesMirge = weakSelf!.fetchedLeaguesDetails
                }
            }
            self?.finishLoading(withDelay: 0)
            self?.leagueTableView.reloadData()
            
        }
        
        
    }
    
    func startLoading()
    {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(UIColor.blue)           //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor.black)        //HUD Color
        SVProgressHUD.setBackgroundLayerColor(UIColor.black)    //Background Color
        SVProgressHUD.show()
    }
    
    func finishLoading(withDelay delay: TimeInterval){
        SVProgressHUD.dismiss(withDelay: delay)
    }
}
