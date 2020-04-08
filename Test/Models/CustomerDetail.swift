//
//  CustomerDetail.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import SwiftyJSON

struct CustomerDetail {
    
    let customerGrade : String!
    let id : String!
    let isCustomerPremium : Bool!
    let name : String!
    let sex : String!
 
    init(json : JSON) {
        customerGrade = json["customerGrade"].stringValue
        id = json["id"].stringValue
        isCustomerPremium = json["isCustomerPremium"].boolValue
        name = json["name"].stringValue
        sex = json["sex"].stringValue
    }
    
}

