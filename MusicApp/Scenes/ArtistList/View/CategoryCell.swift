//
//  CategoryCell.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var artists: [ArtistsViewModel] = []
    
    
    func configureCell(_ category: CategoryModel) {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.artists = category.artists
        
        name.text = category.name
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
    
        self.collectionView.collectionViewLayout = layout
        
        collectionView.reloadData()
    }
}

extension CategoryCell: UICollectionViewDelegate {
    
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistCell", for: indexPath) as! ArtistCell
        
        let artist = artists[indexPath.row]
        cell.configureCell(artist)
        
        return cell
    }
}


extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 138, height: 190)
    }
}
