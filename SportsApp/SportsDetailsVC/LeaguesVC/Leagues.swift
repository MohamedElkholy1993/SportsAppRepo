//
//  Leagues.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation

public class Leagues {
    public var idLeague : String?
    public var strLeague : String?
    public var strSport : String?
    public var strLeagueAlternate : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let leagues_list = Leagues.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Leagues Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Leagues]
    {
        var models:[Leagues] = []
        for item in array
        {
            models.append(Leagues(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let leagues = Leagues(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Leagues Instance.
*/
    required public init?(dictionary: NSDictionary) {

        idLeague = dictionary["idLeague"] as? String
        strLeague = dictionary["strLeague"] as? String
        strSport = dictionary["strSport"] as? String
        strLeagueAlternate = dictionary["strLeagueAlternate"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.idLeague, forKey: "idLeague")
        dictionary.setValue(self.strLeague, forKey: "strLeague")
        dictionary.setValue(self.strSport, forKey: "strSport")
        dictionary.setValue(self.strLeagueAlternate, forKey: "strLeagueAlternate")

        return dictionary
    }

}
