//
//  SpotifyAccessTokenModel.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/10.
//

import Foundation

struct SpotifyAccessTokenModel: Codable {
    let access_token:String
    let token_type:String
    let scope:String
    let expires_in:Int
    let refresh_token:String
}
