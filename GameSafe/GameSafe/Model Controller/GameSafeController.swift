//
//  GameSafeController.swift
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

struct HTTPMethod {
    static let get = "GET"
    static let put = "PUT"
    static let post = "POST"
    static let delete = "DELETE"
}

class GameSafeController {
    
    private let baseURL = URL(string: "https")!
    
    func signUp(username: String, password: String, completion: @escaping (Error?) -> Void = { _ in }) {
        let signUpURL = baseURL.appendingPathComponent("register")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userParams = ["username": username, "password": password] as [String: Any]
        do {
            let json = try JSONSerialization.data(withJSONObject: userParams, options: .prettyPrinted)
            request.httpBody = json
        } catch {
            NSLog("Error encoding JSON")
            return
        }
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                completion(error)
                return
            }
            NSLog("Successfully signed up User")
            
            completion(nil)
        } .resume()
    }
    
    func signIn() {
        
    }
}
