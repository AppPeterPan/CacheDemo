//
//  NetworkController.swift
//  CacheDemo
//
//  Created by SHIH-YING PAN on 2020/1/24.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import UIKit

class NetworkController {
    static let shared = NetworkController()
    
    let imageCache = NSCache<NSURL, UIImage>()
    
    func fetchImage(url: URL, completionHandler: @escaping (UIImage?) -> ()) {
        if let image = imageCache.object(forKey: url as NSURL) {
            completionHandler(image)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url as NSURL)
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
    
    
    
    func fetchTopMovies(completionHandler: @escaping ([Feed]?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/tw/movies/top-movies/all/100/explicit.json") else {
            completionHandler(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let data = data, let movieData = try? decoder.decode(MovieData.self, from: data) {
                completionHandler(movieData.feed.results)
            } else {
                completionHandler(nil)
            }
        }.resume()
        
    }
    
    
    
}
