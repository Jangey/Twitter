//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Jangey Lu on 9/29/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    // TODO: Add properties
    var name: String?
    var screenName: String?
    
    // TODO: Create initializer
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        // Initialize any other properties
    }
    
    static var current: User?
}
