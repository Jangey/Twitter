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
    var screenname: String
    var id: Int64
    var profileURLPath: URL
    
    // TODO: Create initializer
    init(dictionary: [String: Any]) {
        name = (dictionary["name"] as? String)!
        screenname = (dictionary["screen_name"] as? String)!
        // Initialize any other properties
        id = dictionary["id"] as! Int64
        profileURLPath = URL(string: dictionary["profile_image_url_https"] as! String)!
    }
    
    static var current: User?
}
