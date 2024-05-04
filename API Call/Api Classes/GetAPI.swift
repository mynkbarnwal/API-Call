//
//  GetAPI.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit

class GetAPI: NSObject {
    
    let GET_USERS_URL = "https://api.github.com/users"

    func getUserDetails(completionHandler: @escaping (Result<GitUserModal, ServerError>) -> Void ) {
        
        let urlString = String(format: GET_USERS_URL)
        var request = ServerInterface.getRequestWithOutToken(urlString: urlString)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { Data, response, error in
            
            guard let data = Data,
                  error == nil else {
                
                print("error= "+error!.localizedDescription)
                
                DispatchQueue.main.async(execute: {
                    completionHandler(.failure(.noInternetConnection))
                })
                return
            }
            do {
                
                print("Function: \(#function) = data = \(String(decoding: data, as: UTF8.self))")
                
                let userArray = try JSONDecoder().decode(GitUserModal.self, from: data)
                
                DispatchQueue.main.async(execute: {
                    completionHandler(.success(userArray))
                })
            }
            catch{
                print("Error info: \(error)")
                DispatchQueue.main.async(execute: {
                    completionHandler(.failure(.invalidDecoding))
                })
            }
        }).resume()
    }
}
