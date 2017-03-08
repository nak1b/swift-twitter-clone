//
//  HomeDataSource.swift
//  twitter
//
//  Created by Nakib on 2/4/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSouce: Datasource, JSONDecodable {
    
    let users:[User]
    let tweets:[Tweet]
    
    required init(json: JSON) throws {
        let usersArray = json["users"].array
       
        
        var users = [User]()
        var tweets = [Tweet]()
        
        for userJson in usersArray! {
            let user = User(json: userJson)
            users.append(user)
        }
        
        let tweetArray = json["tweets"].array
        
        for tweetJson in tweetArray! {
            let userJson = tweetJson["user"]
            let message = tweetJson["message"].stringValue
            
            let user = User(json: userJson)
            let tweet = Tweet(user: user, message: message)
            tweets.append(tweet)
        }
        
        self.users = users
        self.tweets = tweets
    }

    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        
        return users[indexPath.row]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
