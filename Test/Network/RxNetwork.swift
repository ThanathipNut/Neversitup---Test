//
//  RxNetwork.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import Alamofire
import RxSwift

class RxNetwork<T: Any> {
    
    private var response: T? = nil
    
    /* Handle status network */
    private let messageNoInternetConnection = NSLocalizedString("Network:NoInternetConnection", comment: "")
    private let messageServerInternalError = NSLocalizedString("Network:ServerFailure", comment: "")
    private var isAvailableNetwork: Bool { return NetworkManager.isConnectingInternet }
    
    func request(_ observable: Observable<T>,
                 onSuccess: @escaping (_ response: T) -> Void,
                 onFailure: @escaping (_ error: String) -> Void,
                 onLoading: () -> Void,
                 onLoaded: @escaping () -> Void) -> Disposable? {
        if (isAvailableNetwork) {
            onLoading()
            return observable.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .take(20)
                .subscribe({ e in
                    switch e {
                    case .next(let value):
                        self.response = value
                    case .error(let error):
                        print(error)
                        onLoaded()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            onFailure(error.localizedDescription)
                        }
                    case .completed:
                        onLoaded()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            onSuccess(self.response!)
                        }
                    }
                })
        } else {
            onFailure(messageNoInternetConnection)
        }
        
        return nil
    }
    
    func request(_ observable: Observable<T>,
                 onSuccess: @escaping (_ response: T) -> Void,
                 onFailure: @escaping (_ error: String) -> Void) -> Disposable? {
        if (isAvailableNetwork) {
            return observable.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .take(20)
                .subscribe({ e in
                    switch e {
                    case .next(let value):
                        self.response = value
                    case .error(let error):
                        print(error)
                        onFailure(error.localizedDescription)
                    case .completed:
                        onSuccess(self.response!)
                    }
                })
        } else {
            onFailure(messageNoInternetConnection)
        }
        
        return nil
    }
    
    func request(_ observable: Observable<T>) -> Disposable? {
        if (isAvailableNetwork) {
            return observable.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .take(20)
                .subscribe({ e in
                    switch e {
                    case .next(_):
                        break
                    case .error(let error):
                        print(error)
                    case .completed:
                        break
                        
                    }
                })
        } else {
            print(messageNoInternetConnection)
        }
        
        return nil
    }
    
}
