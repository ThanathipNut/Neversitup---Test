//
//  CustomerDetailResponse.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import SwiftyJSON

struct CustomerDetailResponse {
    
    let status: Int!
    let customerDetail: CustomerDetail!
    
    init(json : JSON) {
        status = json["status"].intValue
        customerDetail = CustomerDetail(json: json["data"])
    }
    
}
