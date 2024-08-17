//
//  APIKeyManager.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/16.
//

import Foundation

class APIKeyManager {
    static let shared = APIKeyManager()
    
    private init() {}
    
    func apiKey(for service: String) -> String? {
        print("apikeyの処理の中にいると")
        guard let keys = Bundle.main.infoDictionary?["APIKeys"] as? [String: Any],
              let key = keys[service] as? String else {
            return nil
        }
        print(key)
        return key
    }
}
