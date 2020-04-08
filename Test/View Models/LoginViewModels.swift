//
//  LoginViewModels.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import RxSwift

class LoginViewModel {
    
    private var viewController: LoginViewController!
    private var apiService: APIService!
    var customers: [Customer]! = []
    
    init(_ viewControllor: LoginViewController) {
        viewController = viewControllor
        apiService = APIService.default
    }
    
    func login(username: String, password: String) -> Disposable? {
        return RxNetwork<AccessTokenResponse>().request(apiService.login(username: username, password: password), onSuccess: { (response) in
            UserManager.default.storeAccessToken(response)
            self.customers = response.customers
            self.viewController.performSegue(withIdentifier: "LogedInSegue", sender: nil)
            
        }, onFailure: { (error) in
            let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self.viewController.present(alert, animated: true)
        })
    }
    
}
