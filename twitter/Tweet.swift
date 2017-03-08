//
//  Tweet.swift
//  twitter
//
//  Created by Nakib on 3/5/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
