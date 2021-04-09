//
//  SportBase.swift
//  SportsApp
//
//  Created by Mina Hany on 3/26/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation

public class SportBase {
    public var sports : Array<Sports>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [SportBase]
    {
        var models:[SportBase] = []
        for item in array
        {
            models.append(SportBase(dictionary: item as! NSDictionary)!)
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

        if (dictionary["sports"] != nil) { sports = Sports.modelsFromDictionaryArray(array: dictionary["sports"] as! NSArray) }
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
