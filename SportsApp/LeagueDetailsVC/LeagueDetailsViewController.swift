//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/19/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import SVProgressHUD
import AnimatedCollectionViewLayout

class LeagueDetailsViewController: UIViewController {
    var leagueToView = League()
    //var leagueID:String = "4335"
    let resultsAPI = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    let eventsAPI = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    let teamsAPI = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
    
    @IBOutlet weak var upComingEventView: UpComingEventsView!
    @IBOutlet weak var latestResultsView: LatestResultsView!
    @IBOutlet weak var teamsView: TeamsView!
    
//    var leagueSender:SendLeagueToFavourite?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarConfiguration()
        fetchEvents()
        fetchResults()
        fetchTeams()
        teamsView?.teamSender = self
        collectionViewAnimationConfiguration()
        
       
    }
    
    @objc func addToFavourite(){
        leagueToView.isFavourite = true
        CoreDataLayer.shared.addLeagueToStorage(leagueToView)
    }
    
    fileprivate func navigationBarConfiguration() {
        // Do any additional setup after loading the view.
        
        let favouriteButton = UIBarButtonItem(title: "🖤", style: .plain, target: self, action: #selector(addToFavourite))
        
        if leagueToView.isFavourite{
            favouriteButton.isEnabled = false
        }else{
            favouriteButton.isEnabled = true
        }
        
        //favouriteButton.tintColor = UIColor.black
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationItem.rightBarButtonItem = favouriteButton
        self.navigationItem.title = leagueToView.leagueName
    }
    
    fileprivate func collectionViewAnimationConfiguration() {
        let upComingEventAnimatedLayout = AnimatedCollectionViewLayout()
        upComingEventAnimatedLayout.animator = ZoomInOutAttributesAnimator()
        let latestResultsAnimatedLayout = AnimatedCollectionViewLayout()
        latestResultsAnimatedLayout.animator = ZoomInOutAttributesAnimator()
        let teamsAnimatedLayout = AnimatedCollectionViewLayout()
        teamsAnimatedLayout.animator = ZoomInOutAttributesAnimator()
        
        latestResultsView.resultsCollectionView.collectionViewLayout = latestResultsAnimatedLayout
        
        upComingEventView.eventsCollectionView.collectionViewLayout = upComingEventAnimatedLayout
        if let flowLayout = upComingEventView.eventsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        teamsView.teamsCollectionView.collectionViewLayout = teamsAnimatedLayout
        if let flowLayout = teamsView.teamsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
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
    
    func fetchEvents(){
        startLoading()
        NetworkLayer.shared.getDataFromAPI(api: eventsAPI+leagueToView.leagueID!) { [weak self](data, error) in
            let weakSelf = self
            var fetchedEvents = [Event]()
            if let dataDictionary = data as? [String:Any]{
                if let eventsArray = dataDictionary["events"] as? [Dictionary<String,Any>]{
                    for event in eventsArray{
                        var newEvent = Event()
                        newEvent.eventID = event["idEvent"] as? String
                        newEvent.eventName = event["strEvent"] as? String
                        newEvent.eventDate = event["dateEvent"] as? String
                        newEvent.eventTime = event["strTime"] as? String
                        fetchedEvents.append(newEvent)
                    }
                    weakSelf?.upComingEventView.events = fetchedEvents
                    
                }
            }
        }
    }
    
    func fetchResults(){
        NetworkLayer.shared.getDataFromAPI(api: resultsAPI+leagueToView.leagueID!) { [weak self](data, error) in
            let weakSelf = self
            var fetchedResults = [Results]()
            if let dataDictionary = data as? [String:Any]{
                if let eventsArray = dataDictionary["events"] as? [Dictionary<String,Any>]{
                    for result in eventsArray{
                        var newResult = Results()
                        newResult.homeTeam = result["strHomeTeam"] as? String
                        newResult.awayTeam = result["strAwayTeam"] as? String
                        newResult.homeTeamScore = result["intHomeScore"] as? String
                        newResult.awayTeamScore = result["intAwayScore"] as? String
                        newResult.date = result["dateEvent"] as? String
                        newResult.time = result["strTime"] as? String
                        fetchedResults.append(newResult)
                    }
                    weakSelf?.latestResultsView.results = fetchedResults
                }
            }
        }
    }
    
    func fetchTeams(){
        NetworkLayer.shared.getDataFromAPI(api: teamsAPI+leagueToView.leagueID!) { [weak self](data, error) in
            guard let weakSelf = self else{return}
            var fetchedTeams = [Team]()
            if let dataDictionary = data as? [String:Any]{
                if let teamsArray = dataDictionary["teams"] as? [Dictionary<String,Any>]{
                    
                    for team in teamsArray{
                        var newTeam = Team()
                        newTeam.teamID = team["idTeam"] as? String
                        newTeam.leagueName = team["strLeague"] as? String
                        newTeam.sportName = team["strSport"] as? String
                        newTeam.teamName = team["strTeam"] as? String
                        newTeam.teamBadge = team["strTeamBadge"] as? String
                        newTeam.teamJersey = team["strTeamJersey"] as? String
                        newTeam.stadiumThumbnail = team["strStadiumThumb"] as? String
                        newTeam.Description = team["strDescriptionEN"] as? String
                        
                        fetchedTeams.append(newTeam)
                    }
                    weakSelf.teamsView.teams = fetchedTeams
                    DispatchQueue.main.async {
                        weakSelf.finishLoading(withDelay: 0)
                    }
                }
            }
        }
    }
}

extension LeagueDetailsViewController: SendTeamProtocol{
    func sendTeam(team: Team) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as? TeamDetailsViewController {
            viewController.modalTransitionStyle = .coverVertical
            viewController.teamToView = team
            present(viewController, animated: true)
        }
    }
}
    
    

