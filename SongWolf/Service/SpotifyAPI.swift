//
//  SpotifyAPI.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/10.
//

import Foundation
import Alamofire

final class SpotifyAPI {
    // シングルトン
    static let shared = SpotifyAPI()
    private init() {}

    let clientID = "142403b775e745b0bce107688ce0c15c"
    let clientSecret = "4a3168d451814b2e918bbd97f119a1f0"
    let baseOAuthURL = "https://accounts.spotify.com/authorize"
    let baseAPIURL = "https://api.spotify.com/v1"
    let getTokenEndPoint = "https://accounts.spotify.com/api/token"

    let scopes = "user-read-private%20playlist-read-private%20playlist-read-collaborative"
    let redirectURI = "https://songwolf/callback"
    let stateStr = "stateを入力"
    let grantType = "authorization_code"

    enum  URLParameterName: String {
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case redirectURI = "redirect_uri"
        case grantType = "grant_type"
    }

    var oAuthURL: URL {
        return URL(string: "\(baseOAuthURL)?response_type=code&client_id=\(clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&state=\(stateStr)&show_dialog=TRUE")!
    }
    
    func postAuthorizationCode(code: String, completion: ((SpotifyAccessTokenModel?, Error?) -> Void)? = nil ) {
        
        guard let url = URL(string: getTokenEndPoint) else {
            completion?(nil, APIError.postAuthorizationCode)
            return
        }
        
        let basicAuthCode = clientID+":"+clientSecret
        let data = basicAuthCode.data(using: .utf8)
        
        guard let base64Authcode = data?.base64EncodedString() else {
            completion?(nil, APIError.postAuthorizationCode)
            return
        }
        
        let parameters = [
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": redirectURI
        ]
        
        let getTokenHeaders: HTTPHeaders = [
            "Authorization": "Basic \(base64Authcode)"
        ]
        
        AF.request(
            
            url, method: .post,
            parameters: parameters,
            headers: getTokenHeaders
            
        ).responseDecodable(of: SpotifyAccessTokenModel.self) { response in
            
            switch response.result {
                
            case .success(let accessToken):
                    completion?(accessToken, nil)
                
            case .failure(let error):
                    completion?(nil, error)
            }
        }
    }
}
