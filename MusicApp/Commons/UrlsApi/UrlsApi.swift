//
//  UrlsApi.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class UrlsApi: UrlsApiProtocol {
    
    private let baseUlr = "https://api.spotify.com/v1/"
    
    func search() -> String {
        return baseUlr + "search/"
    }
    
    func token() -> String {
        return "https://accounts.spotify.com/api/token"
    }
    
    func listOfCategories() -> String {
        return baseUlr + "browse/categories"
    }
    
    func topArtists() -> String {
        return baseUlr + "me/top/artists"
    }
    
    func artistsAlbums(artistId: String) -> String {
        return baseUlr + "/artists/" + artistId + "/albums"
    }
}
