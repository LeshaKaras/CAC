//
//  RequestManager.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//

import UIKit
import Alamofire

class RequestManager: NSObject {

    static let accessManager = RequestManager()
    
    func executeFetchRequestDataCountriesAndCities() {
        
        let request = "https://raw.githubusercontent.com/David-Haim/CountriesToCitiesJSON/master/countriesToCities.json"
        
        Alamofire.request(request,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON { response in
                            
            if response.result.isSuccess {

                DataManager.accessManager.loadData(dictionaryResponse: response.result.value as! NSDictionary)
                
            } else {
                
                print("response.result.isFailure")

            }
    }
        
  }
    
}
