//
//  AccessTokenResponse.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import SwiftyJSON

struct AccessTokenResponse {
    
    let status: Int!
    let token: String!
    var customers: [Customer] = []
    
    init(json : JSON) {
        status = json["status"].intValue
        token = json["token"].stringValue
        if let jsonArray = json["customers"].array {
            for jsonObject in jsonArray {
                let customer = Customer(json: jsonObject)
                customers.append(customer)
            }
        }
    }
    
}
