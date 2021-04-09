//
//  LeagueMirge.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation
    public class LeagueMirge {
        public var idLeague : String?
        public var idSoccerXML : String?
        public var idAPIfootball : String?
        public var strSport : String?
        public var strLeague : String?
        public var strLeagueAlternate : String?
        public var strDivision : String?
        public var idCup : String?
        public var strCurrentSeason : String?
        public var intFormedYear : String?
        public var dateFirstEvent : String?
        public var strGender : String?
        public var strCountry : String?
        public var strWebsite : String?
        public var strFacebook : String?
        public var strTwitter : String?
        public var strYoutube : String?
        public var strRSS : String?
        public var strDescriptionEN : String?
        public var strDescriptionDE : String?
        public var strDescriptionFR : String?
        public var strDescriptionIT : String?
        public var strDescriptionCN : String?
        public var strDescriptionJP : String?
        public var strDescriptionRU : String?
        public var strDescriptionES : String?
        public var strDescriptionPT : String?
        public var strDescriptionSE : String?
        public var strDescriptionNL : String?
        public var strDescriptionHU : String?
        public var strDescriptionNO : String?
        public var strDescriptionPL : String?
        public var strDescriptionIL : String?
        public var strFanart1 : String?
        public var strFanart2 : String?
        public var strFanart3 : String?
        public var strFanart4 : String?
        public var strBanner : String?
        public var strBadge : String?
        public var strLogo : String?
        public var strPoster : String?
        public var strTrophy : String?
        public var strNaming : String?
        public var strComplete : String?
        public var strLocked : String?

    /**
        Returns an array of models based on given dictionary.
        
        Sample usage:
        let leagues_list = Leagues.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

        - parameter array:  NSArray from JSON dictionary.

        - returns: Array of Leagues Instances.
    */
        public class func modelsFromDictionaryArray(array:NSArray) -> [LeagueMirge]
        {
            var models:[LeagueMirge] = []
            for item in array
            {
                models.append(LeagueMirge(dictionary: item as! NSDictionary)!)
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
            idSoccerXML = dictionary["idSoccerXML"] as? String
            idAPIfootball = dictionary["idAPIfootball"] as? String
            strSport = dictionary["strSport"] as? String
            strLeague = dictionary["strLeague"] as? String
            strLeagueAlternate = dictionary["strLeagueAlternate"] as? String
            strDivision = dictionary["strDivision"] as? String
            idCup = dictionary["idCup"] as? String
            strCurrentSeason = dictionary["strCurrentSeason"] as? String
            intFormedYear = dictionary["intFormedYear"] as? String
            dateFirstEvent = dictionary["dateFirstEvent"] as? String
            strGender = dictionary["strGender"] as? String
            strCountry = dictionary["strCountry"] as? String
            strWebsite = dictionary["strWebsite"] as? String
            strFacebook = dictionary["strFacebook"] as? String
            strTwitter = dictionary["strTwitter"] as? String
            strYoutube = dictionary["strYoutube"] as? String
            strRSS = dictionary["strRSS"] as? String
            strDescriptionEN = dictionary["strDescriptionEN"] as? String
            strDescriptionDE = dictionary["strDescriptionDE"] as? String
            strDescriptionFR = dictionary["strDescriptionFR"] as? String
            strDescriptionIT = dictionary["strDescriptionIT"] as? String
            strDescriptionCN = dictionary["strDescriptionCN"] as? String
            strDescriptionJP = dictionary["strDescriptionJP"] as? String
            strDescriptionRU = dictionary["strDescriptionRU"] as? String
            strDescriptionES = dictionary["strDescriptionES"] as? String
            strDescriptionPT = dictionary["strDescriptionPT"] as? String
            strDescriptionSE = dictionary["strDescriptionSE"] as? String
            strDescriptionNL = dictionary["strDescriptionNL"] as? String
            strDescriptionHU = dictionary["strDescriptionHU"] as? String
            strDescriptionNO = dictionary["strDescriptionNO"] as? String
            strDescriptionPL = dictionary["strDescriptionPL"] as? String
            strDescriptionIL = dictionary["strDescriptionIL"] as? String
            strFanart1 = dictionary["strFanart1"] as? String
            strFanart2 = dictionary["strFanart2"] as? String
            strFanart3 = dictionary["strFanart3"] as? String
            strFanart4 = dictionary["strFanart4"] as? String
            strBanner = dictionary["strBanner"] as? String
            strBadge = dictionary["strBadge"] as? String
            strLogo = dictionary["strLogo"] as? String
            strPoster = dictionary["strPoster"] as? String
            strTrophy = dictionary["strTrophy"] as? String
            strNaming = dictionary["strNaming"] as? String
            strComplete = dictionary["strComplete"] as? String
            strLocked = dictionary["strLocked"] as? String
        }

            
    /**
        Returns the dictionary representation for the current instance.
        
        - returns: NSDictionary.
    */
        public func dictionaryRepresentation() -> NSDictionary {

            let dictionary = NSMutableDictionary()

            dictionary.setValue(self.idLeague, forKey: "idLeague")
            dictionary.setValue(self.idSoccerXML, forKey: "idSoccerXML")
            dictionary.setValue(self.idAPIfootball, forKey: "idAPIfootball")
            dictionary.setValue(self.strSport, forKey: "strSport")
            dictionary.setValue(self.strLeague, forKey: "strLeague")
            dictionary.setValue(self.strLeagueAlternate, forKey: "strLeagueAlternate")
            dictionary.setValue(self.strDivision, forKey: "strDivision")
            dictionary.setValue(self.idCup, forKey: "idCup")
            dictionary.setValue(self.strCurrentSeason, forKey: "strCurrentSeason")
            dictionary.setValue(self.intFormedYear, forKey: "intFormedYear")
            dictionary.setValue(self.dateFirstEvent, forKey: "dateFirstEvent")
            dictionary.setValue(self.strGender, forKey: "strGender")
            dictionary.setValue(self.strCountry, forKey: "strCountry")
            dictionary.setValue(self.strWebsite, forKey: "strWebsite")
            dictionary.setValue(self.strFacebook, forKey: "strFacebook")
            dictionary.setValue(self.strTwitter, forKey: "strTwitter")
            dictionary.setValue(self.strYoutube, forKey: "strYoutube")
            dictionary.setValue(self.strRSS, forKey: "strRSS")
            dictionary.setValue(self.strDescriptionEN, forKey: "strDescriptionEN")
            dictionary.setValue(self.strDescriptionDE, forKey: "strDescriptionDE")
            dictionary.setValue(self.strDescriptionFR, forKey: "strDescriptionFR")
            dictionary.setValue(self.strDescriptionIT, forKey: "strDescriptionIT")
            dictionary.setValue(self.strDescriptionCN, forKey: "strDescriptionCN")
            dictionary.setValue(self.strDescriptionJP, forKey: "strDescriptionJP")
            dictionary.setValue(self.strDescriptionRU, forKey: "strDescriptionRU")
            dictionary.setValue(self.strDescriptionES, forKey: "strDescriptionES")
            dictionary.setValue(self.strDescriptionPT, forKey: "strDescriptionPT")
            dictionary.setValue(self.strDescriptionSE, forKey: "strDescriptionSE")
            dictionary.setValue(self.strDescriptionNL, forKey: "strDescriptionNL")
            dictionary.setValue(self.strDescriptionHU, forKey: "strDescriptionHU")
            dictionary.setValue(self.strDescriptionNO, forKey: "strDescriptionNO")
            dictionary.setValue(self.strDescriptionPL, forKey: "strDescriptionPL")
            dictionary.setValue(self.strDescriptionIL, forKey: "strDescriptionIL")
            dictionary.setValue(self.strFanart1, forKey: "strFanart1")
            dictionary.setValue(self.strFanart2, forKey: "strFanart2")
            dictionary.setValue(self.strFanart3, forKey: "strFanart3")
            dictionary.setValue(self.strFanart4, forKey: "strFanart4")
            dictionary.setValue(self.strBanner, forKey: "strBanner")
            dictionary.setValue(self.strBadge, forKey: "strBadge")
            dictionary.setValue(self.strLogo, forKey: "strLogo")
            dictionary.setValue(self.strPoster, forKey: "strPoster")
            dictionary.setValue(self.strTrophy, forKey: "strTrophy")
            dictionary.setValue(self.strNaming, forKey: "strNaming")
            dictionary.setValue(self.strComplete, forKey: "strComplete")
            dictionary.setValue(self.strLocked, forKey: "strLocked")

            return dictionary
        }

    }

