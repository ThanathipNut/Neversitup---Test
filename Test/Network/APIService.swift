//
//  APIService.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import Alamofire
import SwiftyJSON
import RxSwift

class APIService {
    
    private let networkManager = NetworkManager.default()
    
    private init() {}
    
    static let `default` = APIService()
    
    func login(username: String, password: String) -> Observable<AccessTokenResponse> {
        return Observable<AccessTokenResponse>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = self.networkManager.request(APIRouter.login(username, password)).responseJSON { response in
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case .success(let value):
                    let data = AccessTokenResponse(json: JSON(value))
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getCustomerDetail(token: String, customerId: String) -> Observable<CustomerDetailResponse> {
        return Observable<CustomerDetailResponse>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = self.networkManager.request(APIRouter.getCustomerDetail(token, customerId)).responseJSON { response in
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case .success(let value):
                    let data = CustomerDetailResponse(json: JSON(value))
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}
