//
//  HomeDataSource.swift
//  twitter
//
//  Created by Nakib on 2/4/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents


class HomeDataSouce: Datasource {
    
    let users:[User] = {
        let user1 = User(name: "Nakib Momin", username: "@nakib14", bioText: "This is test description for demo twitter clone application for iOS using swift programming language.", profileImage: #imageLiteral(resourceName: "profile-image"))
        
        let user2 = User(name: "John Doe", username: "@john.doe", bioText: "Another sample description for demo twitter clone application.", profileImage: #imageLiteral(resourceName: "demo-profile2"))
        
        
        let user3 = User(name: "Michael", username: "@michael", bioText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.", profileImage: #imageLiteral(resourceName: "demo-profile3"))
        
        
        return [user1, user2, user3]
    }()
    
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [HomeCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
