//
//  ArtistsResponse.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

struct ArtistsResponse: Codable {
    let artists: ArtistsResult
}

struct TopArtistsResponse: Codable {
    let items: [ArtistsModel]
    let limit: Int
    let offset: Int
    let total: Int
}
