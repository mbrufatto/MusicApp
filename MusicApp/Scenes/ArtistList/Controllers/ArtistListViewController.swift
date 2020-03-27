//
//  ArtistListViewController.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var artistListViewModel = ArtistListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Artists"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.fetchTopArtists()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            if self.artistListViewModel.next != nil {
                self.fetchTopArtists()
            }
        }
    }
    
    fileprivate func fetchArtistsByName(termSearch: String, offset: Int, limit: Int) {
        
        artistListViewModel.loadArtistsByName(termSearch: "guns", offset: 0, limit: 20) { (result, error) in
            if error != nil {
                print(result?.artists.items as Any)
            } else {
                print(error as Any)
            }
        }
    }
    
    fileprivate func fetchTopArtists() {
        artistListViewModel.loadTopArtists() { (result, error) in
            if error == nil {
                self.tableView.reloadData()
            } else {
                print(error as Any)
            }
        }
    }
}

extension ArtistListViewController: UITableViewDelegate {
}

extension ArtistListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.artistListViewModel.numberOfRows(0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        
        let category = artistListViewModel.categoryAt(indexPath.row)
        cell.configureCell(category)
        
        return cell
    }
}
