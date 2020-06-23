//
//  NetworkDataLoader.swift
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


protocol NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
}
