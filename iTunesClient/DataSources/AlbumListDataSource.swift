//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private let albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
        super.init()
    }
    
    //MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        // gets album at row index -- assigne to album
        let album = albums[indexPath.row]
        
        // assign AlbumViewModel struct with album at index to "viewModel"
        let viewModel = AlbumCellViewModel(album: album)
        
        // configure ablum cell with view model output
        albumCell.configureWithViewModel(with: viewModel)
        
        albumCell.accessoryType = .disclosureIndicator
        
        return albumCell
    }
    

}
