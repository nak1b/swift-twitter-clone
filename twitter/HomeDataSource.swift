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
        guard let usersJsonArray = json["users"].array,  let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON vas not valid"])
        }

        self.users = usersJsonArray.map({ return User(json: $0) })
        self.tweets = tweetJsonArray.map({ return Tweet(json: $0) })
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
