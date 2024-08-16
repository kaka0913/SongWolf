//
//  SearchResponse.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/15.
//

import Foundation

struct SearchResponse: Codable {
    let tracks: TracksResponse
}

struct TracksResponse: Codable {
    let items: [Track]
}

struct Track: Codable {
    let id: String
    let name: String
    let artists: [Artist]
}

struct Artist: Codable {
    let name: String
}
