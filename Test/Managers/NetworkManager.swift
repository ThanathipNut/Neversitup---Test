//
//  NetworkManager.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: SessionManager {
    
    static var isConnectingInternet: Bool { return NetworkReachabilityManager()?.isReachable ?? false }
    
    static private let instance = NetworkManager()
    
    static func `default`() -> NetworkManager {
        return instance
    }
    
}
