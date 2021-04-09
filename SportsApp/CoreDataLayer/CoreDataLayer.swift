//
//  CoreDataLayer.swift
//  MovieList
//
//  Created by moutaz hegazy on 3/11/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class CoreDataLayer{
    
    private(set) var storedLeagues = [LeagueCore]()
    private static var coreDataObj = CoreDataLayer()
    static var shared : CoreDataLayer {
        get{
            coreDataObj.getDataFromStorage()
            return coreDataObj
        }
    }
    
    //MARK:- Core Data Methods
    private func getDataFromStorage(){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest : NSFetchRequest<LeagueCore> = LeagueCore.fetchRequest()
            do{
                storedLeagues = try managedContext.fetch(fetchRequest)
            }catch let error as NSError{
                print(error)
            }
        }
    }
    
    
    func addLeagueToStorage(_ league: League){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            
            if league.leagueName != nil,!(isLeagueFound(with: league.leagueID) ?? true){
                let newLeague = LeagueCore(context: managedContext)
                newLeague.idLeague = league.leagueID
                newLeague.leagueName = league.leagueName
                newLeague.sportName = league.sportName
                newLeague.youtubeLink = league.youtubeLink
                newLeague.leagueBadge = league.leagueBadge
                newLeague.isFavourite = league.isFavourite
                newLeague.leagueAlternate = league.leagueAlternate
                
                storedLeagues += [newLeague]
                
                do{
                    try managedContext.save()
                    print("<<<<< SAVED")
                }catch let error as NSError{
                    print(error)
                }
            }
        }
    }
    
    private func isLeagueFound(with leagueID : String?)->Bool?{
        guard let id = leagueID else{
            return nil
        }
        if storedLeagues.count == 0{
            getDataFromStorage()
        }
        for league in storedLeagues{
            if(league.idLeague == id){
                return true
            }
        }
        return false
    }
    
    
    
    func deleteFromStorage(at index:Int ){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(storedLeagues[index])
            storedLeagues.remove(at: index)
            do{
                try managedContext.save();
                print("item Deleted")
            }catch let error as NSError{
                print(error);
            }
        }
    }
    
}

