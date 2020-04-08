//
//  Customer.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import SwiftyJSON

struct Customer {
    
    let id : String!
    let name : String!
 
    init(json : JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
    
}
