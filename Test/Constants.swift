//
//  Constants.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

struct Constants {
    /* init value */
    static let INITIAL_STRING = ""
    static let INITIAL_INT = 0
    static let INITIAL_DOUBLE = 0.0
    
    /* network */
    static let TOKEN_KEY = "token_key"
    
    enum ContentType: String {
        case key = "Content-Type"
        case json = "application/json"
    }
    
    /* api */
    static let API_PATH = ""
    
    static let BASE_URL = "https://neversitup.pythonanywhere.com/"
    static let BASE_API_URL = BASE_URL + API_PATH
    
}
