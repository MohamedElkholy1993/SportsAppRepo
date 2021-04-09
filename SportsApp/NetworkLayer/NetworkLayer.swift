//
//  NetworkLayer.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/19/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer{
    static var shared = NetworkLayer()
    
    func getDataFromAPI(api:String, onCompletion handler : ((Any?,AFError?)->())?){
        let request = AF.request(api)
        request.responseJSON { (respose) in
            switch respose.result {
            case .success(let data):
                handler?(data,nil)
                
            case .failure(let error):
                handler?(nil,error)
            }
        }
        
        print("test")
    }
}
