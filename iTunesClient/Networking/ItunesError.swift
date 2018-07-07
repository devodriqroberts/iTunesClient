//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/7/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}




