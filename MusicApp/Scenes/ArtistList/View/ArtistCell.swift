//
//  ArtistCell.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import Kingfisher

class ArtistCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func configureCell(_ artit: ArtistsViewModel) {
        self.name.text = artit.name
        self.image.kf.setImage(with: artit.image)
        
        self.image.layer.cornerRadius = image.bounds.height / 2
    }
    
}
