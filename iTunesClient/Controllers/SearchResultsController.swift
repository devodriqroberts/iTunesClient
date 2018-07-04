//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Devodriq Roberts on 7/4/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // create cancel barbuttonitem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
        
        // Create searchbar in searchResultsController
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        //assign self(searchResultsController) as results updater
        searchController.searchResultsUpdater = self
    }
    
     @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}






























//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }