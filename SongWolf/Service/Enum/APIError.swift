//
//  APIError.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/10.
//

import Foundation

enum APIError: Error, LocalizedError {
    
    case authorizationCodeError,urlError,taskError,postAuthorizationCode
    
    var errorDescription: String? {
        switch self {
        case .authorizationCodeError:
            return "認証エラーが発生しています"
        case .urlError:
            return "URLが取得出来ませんでした"
        case .taskError:
            return "データの取得が出来ませんでした"
        case .postAuthorizationCode:
            return "認証コードの送信に失敗しました"
        }
    }
    
}
