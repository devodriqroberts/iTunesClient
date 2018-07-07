//
//  ItunesAPIClient.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/7/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtists(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        let task = downloader.jsonTask(with: endpoint.request) {json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }
                
                guard let results = json["results"] as? [[String:Any]] else {
                    completion([], .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                
                let artist = results.compactMap {Artist(json: $0)}
                completion(artist, nil)
            }
        }
        task.resume()
    }
}








