//
//  AuthViewController.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/10.
//

import Foundation

final class AuthViewController {
    //シングルトン
    static let shared = AuthViewController()
    
    func openURL(url: URL) -> Bool {
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItems.first(where: {$0.name == "code"})?.value,
              let getState = queryItems.first(where: {$0.name == "state"})?.value,
              getState == SpotifyAPI.shared.stateStr
        else {
            return false
        }

        //`code`を引数として渡して、トークンリクエストをする
        SpotifyAPI.shared.postAuthorizationCode(code: code) { accessToken, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let _accessToken = accessToken else {
                print("惜しいぜ、もう少しだ！！")
                return
            }
        // キーを保持
        UserDefaults.standard.set(_accessToken.access_token, forKey: "SpotifyAccessToken")//_accessToken.access_tokenであってるかがわからない
        }
        print("トークン取得完了")
        return true
    }
}
