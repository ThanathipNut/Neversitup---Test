//
//  APIRouter.swift
//  Test
//
//  Created by Thanathip Suppapantita on 8/4/20.
//  Copyright © 2020 Neversitup. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    //The endpoint name we'll call later
    case login(_ username: String, _ password: String)
    case getCustomerDetail(_ token: String, _ customerId: String)
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getCustomerDetail:
            return .post
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .login:
            return "login"
        case .getCustomerDetail:
            return "getCustomerDetail"
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
            
        case .login(let username, let password):
            return [
                "username" : username,
                "password" : password
            ]
            
        case .getCustomerDetail(let token, let customerId):
            return [
                "token" : token,
                "customerId" : customerId
            ]
            
        }
    }
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.BASE_API_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.ContentType.key.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
