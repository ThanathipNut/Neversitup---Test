//
//  DetailViewModels.swift
//  Test
//
//  Created by Thanathip Suppapantita on 9/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import RxSwift

class DetailViewModels {
    
    private var viewController: DetailViewController!
    private var apiService: APIService!
    var customerDetail: CustomerDetail!
    
    init(_ viewControllor: DetailViewController) {
        viewController = viewControllor
        apiService = APIService.default
    }
    
    func getCustomerDetail(token: String, customerId: String) -> Disposable? {
        return RxNetwork<CustomerDetailResponse>().request(apiService.getCustomerDetail(token: token, customerId: customerId), onSuccess: { (response) in
            self.customerDetail = response.customerDetail
            self.viewController.customerGradeLabel.text = self.customerDetail.customerGrade
            self.viewController.idLabel.text = self.customerDetail.id
            if self.customerDetail.isCustomerPremium {
                self.viewController.isCustomerPremiumLabel.text = "Yes"
            } else {
                self.viewController.isCustomerPremiumLabel.text = "No"
            }
            self.viewController.nameLabel.text = self.customerDetail.name
            self.viewController.sexLabel.text = self.customerDetail.sex
            
        }, onFailure: { (error) in
            let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self.viewController.present(alert, animated: true)
        })
    }
    
}
