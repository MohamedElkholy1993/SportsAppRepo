//
//  Sport.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/19/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit

public class Sports {
    public var idSport : String?
    public var strSport : String?
    public var strFormat : String?
    public var strSportThumb : String?
    public var strSportThumbGreen : String?
    public var strSportDescription : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let sports_list = Sports.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Sports Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Sports]
    {
        var models:[Sports] = []
        for item in array
        {
            models.append(Sports(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let sports = Sports(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Sports Instance.
*/
    required public init?(dictionary: NSDictionary) {

        idSport = dictionary["idSport"] as? String
        strSport = dictionary["strSport"] as? String
        strFormat = dictionary["strFormat"] as? String
        strSportThumb = dictionary["strSportThumb"] as? String
        strSportThumbGreen = dictionary["strSportThumbGreen"] as? String
        strSportDescription = dictionary["strSportDescription"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.idSport, forKey: "idSport")
        dictionary.setValue(self.strSport, forKey: "strSport")
        dictionary.setValue(self.strFormat, forKey: "strFormat")
        dictionary.setValue(self.strSportThumb, forKey: "strSportThumb")
        dictionary.setValue(self.strSportThumbGreen, forKey: "strSportThumbGreen")
        dictionary.setValue(self.strSportDescription, forKey: "strSportDescription")

        return dictionary
    }

}
