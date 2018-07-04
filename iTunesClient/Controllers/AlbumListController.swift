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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
}
