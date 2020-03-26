//
//  ArtistsModel.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

struct ArtistsModel: Codable {
    let followers: ArtistsFollowers
    let genres: [String]
    let id: String
    let images: [ArtistsImage]
    let name: String
    let popularity: Int
    let type: String
}
