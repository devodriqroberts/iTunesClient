//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    private var data = [Artist]()

    override init() {
        super.init()
    }
    
    //Update array of artist with new artist from search results
    func update(withArtist artist: [Artist]){
        
        // Updated array of [Artist] is being assigned to constant "data"
        data = artist
    }
    
    //MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assign custom cell to constant "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
        
        // data = [Artist] defined in Artist.swift. Artist at row index is being assigned to constant
        // artist.
        let artist = data[indexPath.row]
        
        // Cell label text being reassigned to artist name at current indexPath.
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helper Methods
    
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
    
    
}










