//
//  Service.swift
//  twitter
//
//  Created by Nakib on 3/6/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
    func fetchHomeFeed(completion: @escaping (HomeDataSouce) -> ()) {
        let request: APIRequest<HomeDataSouce, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDataSource) in
            
            //self.datasource = homeDataSource
            print("Successfully fetched json")
            completion(homeDataSource)
            
        }) { (error) in
            print("Failed to fetch json...", error)
        }
    }
    
}
