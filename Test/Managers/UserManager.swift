//
//  UserManager.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import KeychainSwift

class UserManager {
    
    private let keychain = KeychainSwift()              // the keychain to store sensitive data (token)
    private let userDefaults = UserDefaults.standard    // the userDefaults to store data (app setting)
    
    var token: String { return keychain.get(Constants.TOKEN_KEY) ?? Constants.INITIAL_STRING }
    
    private init() {}
    
    static let `default` = UserManager()
    
    func storeAccessToken(_ accessToken: AccessTokenResponse) {
        keychain.set(accessToken.token, forKey: Constants.TOKEN_KEY)
    }
    
    func hasToken() -> Bool {
        if (keychain.get(Constants.TOKEN_KEY) != nil) {
            return true
        } else {
            return false
        }
    }
    
    func destroyAllData() {
        keychain.clear()
        userDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        userDefaults.synchronize()
    }
    
}
