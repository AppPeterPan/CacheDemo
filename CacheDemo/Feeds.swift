//
//  Feeds.swift
//  CacheDemo
//
//  Created by SHIH-YING PAN on 2020/1/24.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var name: String
    var artworkUrl100: URL
    var id: String
}

struct Feeds: Codable {
    var results: [Feed]
}

struct MovieData: Codable {
    var feed: Feeds
}
