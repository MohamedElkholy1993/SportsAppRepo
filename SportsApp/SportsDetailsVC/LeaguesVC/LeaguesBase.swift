//
//  LeaguesBase.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation
public class LeagueBase {
    public var leagues : Array<Leagues>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [LeagueBase]
    {
        var models:[LeagueBase] = []
        for item in array
        {
            models.append(LeagueBase(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
    required public init?(dictionary: NSDictionary) {

        if (dictionary["leagues"] != nil) { leagues = Leagues.modelsFromDictionaryArray(array: dictionary["leagues"] as! NSArray) }
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()


        return dictionary
    }

}
