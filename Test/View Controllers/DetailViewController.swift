//
//  DetailViewController.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var isCustomerPremiumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    private var viewModel: DetailViewModels!
    var customer: Customer!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailViewModels(self)
        
        _ = viewModel.getCustomerDetail(token: UserManager.default.token, customerId: customer.id)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
