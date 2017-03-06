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
    
    required init(json: JSON) throws {
        let array = json["users"].array
        var users = [User]()
        
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
    }

    
    let tweets:[Tweet] = {
        let user1 = User(name: "Nakib Momin", username: "@nakib14", bioText: "This is test description for demo twitter clone application for iOS using swift programming language.", profileImage: #imageLiteral(resourceName: "profile-image"))
        
        let tweet1 = Tweet(user: user1, message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.")
        
        let tweet2 = Tweet(user: user1, message: "This is another example tweet")
        
        return [tweet1, tweet2]
    }()
    
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
