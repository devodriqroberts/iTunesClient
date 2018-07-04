//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    
    // create static constant value for custom cell height
    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }

    // stored property for Artist --
    var artist: Artist!
    
    lazy var dataSource: AlbumListDataSource = {
       return AlbumListDataSource(albums: self.artist.albums)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = artist.name
        
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
}
