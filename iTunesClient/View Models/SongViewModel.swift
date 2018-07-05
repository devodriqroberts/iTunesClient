//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        
        //Track time in milliseconds
        let timeInSeconds = (song.trackTime) / 1000
        let timeInMinutes = timeInSeconds / 60 % 60
        let seconds = timeInSeconds % 60
        
        self.runtime = "\(timeInMinutes):\(seconds)"
    }
}






