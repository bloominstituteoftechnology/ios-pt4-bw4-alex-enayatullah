//
//  URLSession+NetworkDataLoader.swift
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        let task = self.dataTask(with: request) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
