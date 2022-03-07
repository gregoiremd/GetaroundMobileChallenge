//
//  APIManager.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 07/03/2022.
//

import Foundation
import Alamofire

enum APIManager: URLRequestConvertible {
    
    static let endpoint = URL(string: "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api")!
    
    // Creating cases for each API request
    case getCars
    
    // Specifying the endpoints for each API
    var path: String {
        switch self {
            // when you need to pass a parameter to the endpoint
        case .getCars:
            return "/cars.json"
        }
    }
    
    // Specifying the methods for each API
    var method: HTTPMethod {
        switch self {
        case .getCars:
            return .get
        }
    }
    
    // If the API requires body or queryString encoding, it can be specified here
    var encoding : URLEncoding {
        switch self {
        default:
            return .default
        }
    }
    
    // This function will return the request for the API call
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: APIManager.endpoint.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        // encoding the request with the encoding specified above if any
        request = try encoding.encode(request, with: nil)
        return request
    }
    
    // GET API - To get the cars list
    static func getCars(onCompletion: @escaping ([Car]) -> Void) {
        AF.request(APIManager.getCars).responseDecodable(of: [Car].self) { (response) in
            if let jsonData = response.data {
                let jsonDecoder = JSONDecoder()
                let cars = try! jsonDecoder.decode([Car].self, from: jsonData)
                onCompletion(cars)
            }
        }
    }
    
}
