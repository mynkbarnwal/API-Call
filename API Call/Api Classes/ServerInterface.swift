//
//  ServerInterface.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit

typealias CompletionHandler = (_ returnData:Any?) -> Void

enum ServerError:Error, Equatable{
    case invalidResponse
    case noInternetConnection
    case invalidDecoding
    case message(error: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Response is invalid"
        case .noInternetConnection:
            return "Please ensure that your mobile data is activated or that you are connected to a WiFi network. "
        case .invalidDecoding:
            return "Something went wrong!!! Please try again..."
        case .message(let error):
            return error
        }
    }
}

class ServerInterface: NSObject {
    
    static func getRequestWithOutToken(urlString:String) -> URLRequest {
        var request = URLRequest.init(url:URL.init(string: urlString)!)
        request.timeoutInterval = 10.0
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
