//
//  LoginViewController.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(self)
    }

    @IBAction func login(_ sender: Any) {
        _ = viewModel.login(username: usernameTextField.text ?? "",
                        password: passwordTextField.text ?? "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let navigationController = segue.destination as? UINavigationController {
            if let viewController = navigationController.viewControllers.first as? DashboardViewController {
                viewController.customers = viewModel.customers
            }
        }
        
    }
    
}

