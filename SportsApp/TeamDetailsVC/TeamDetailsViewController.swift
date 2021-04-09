//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit



class TeamDetailsViewController: UIViewController {
    var teamToView : Team?
    var teamDetailsView : TeamDetailsView!{
        guard isViewLoaded else{return nil}
        return view as? TeamDetailsView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        teamDetailsView.fetchTeamImagesAndDescription(team: teamToView!)
        
    }
    
    
}
