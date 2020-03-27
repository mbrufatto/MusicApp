//
//  ArtistListViewModel.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 26/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Alamofire

class ArtistListViewModel {
    
    var urlsApi: UrlsApi = UrlsApi()
    var network: Network = Network()
    
    private var genres: [String] = []
    private var categories: [CategoryModel] = []
    private var artists: [ArtistsModel] = []
    
    var total: Int = 0
    var next: String?
    var limit: Int = 20
    var offset: Int = 0
    
    func numberOfRows(_ section: Int) -> Int {
        return self.categories.count
    }
    
    func categoryAt(_ index: Int) -> CategoryModel {
        return self.categories[index]
    }
    
    func loadArtistsByName(termSearch: String, offset: Int, limit: Int, completion: @escaping(ArtistsResponse?, Error?) -> Void) {
        
        let auth: Auth = Auth(network: network, urlsApi: urlsApi)
        
        auth.validateToken(success: {
            
            let url = self.urlsApi.search()
            
            let parameters: Parameters = [
                "q": termSearch,
                "type": "artist",
                "limit": String(limit),
                "offset": String(offset)
            ]
            
            self.network.request(url: url, method: .get, parameters: parameters, success: { response in
                
                do {
                    let searchResponse = try JSONDecoder().decode(ArtistsResponse.self, from: response)
                    print(searchResponse)
                    completion(searchResponse, nil)
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
                
            }, failure: { (error) in
                print(error)
            })
        }, failure: { error in
            print(error)
        })
    }
    
    func loadTopArtists(completion: @escaping(()?, Error?) -> Void) {
        
        let auth: Auth = Auth(network: network, urlsApi: urlsApi)
        
        auth.validateToken(success: {
            
            let url = self.urlsApi.topArtists()
            
            let parameters: Parameters = [
                "limit": String(self.limit),
                "offset": String(self.offset)
            ]
            
            self.network.request(url: url, method: .get, parameters: parameters, success: { response in
                
                do {
                    let topArtists = try JSONDecoder().decode(TopArtistsResponse.self, from: response)
                    self.offset += self.limit
                    self.total = topArtists.total
                    self.next = topArtists.next
                    self.updateArtists(artits: topArtists.items)
                    self.updateCategory()
                    self.categories = self.artistsByCategory()
                    completion((),nil)
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
                
            }, failure: { (error) in
                print(error)
            })
        }, failure: { error in
            print(error)
        })
    }
    
    private func updateCategory() {
        let _ = self.artists.map { (artist) in
            for genre in artist.genres {
                if !self.genres.contains(where: { $0 == genre }) {
                    self.genres.append(genre)
                }
            }
        }
    }
    
    private func updateArtists(artits: [ArtistsModel]) {
        for artist in artits {
            if !self.artists.contains(where: { $0.id == artist.id }) {
                self.artists.append(artist)
            }
        }
    }
    
    private func artistsByCategory() -> [CategoryModel] {
        let categories = self.genres.map { (genre) -> CategoryModel in
            let artistArray = self.artists.filter({ $0.genres.contains(where: { $0 == genre })})
            
            let artistsViewModel = artistArray.map{ (artist) -> ArtistsViewModel in
                var imageUrl = PlaceholderNoImage.noImage640.rawValue
                
                if let image = artist.images.filter({ $0.width >= 300 }).first {
                  imageUrl = image.url
                }
                return ArtistsViewModel(
                    id: artist.id,
                    image: URL(string: imageUrl),
                    name: artist.name,
                    followers: String(artist.followers.total))
            }
            return CategoryModel(name: genre.capitalized, artists: artistsViewModel)
        }
        return categories
    }
}
