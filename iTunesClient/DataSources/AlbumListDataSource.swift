//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private var albums: [Album]
    
    let pendingOperations = PendingOperations()
    let tableView: UITableView
    
    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
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
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        return albumCell
    }
    // MARK: - Helper Methods
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with album: [Album]) {
        self.albums = album
    }
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    
    
}
