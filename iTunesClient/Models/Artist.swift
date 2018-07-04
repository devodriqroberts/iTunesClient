//
//  Artist.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import Foundation

class Artist {
    let id: Int
    let name: String
    let primaryGenre: Genre //Modeled by enum in Genre.swift
    var album: [Album]
    
    init(id: Int, name: String, primaryGenre: Genre, album: [Album]) {
        self.id = id
        self.name = name
        self.primaryGenre = primaryGenre
        self.album = album
    }
}






































