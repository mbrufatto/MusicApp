//
//  UrlsApiProtocol.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

protocol UrlsApiProtocol: class {
    func search() -> String
    func token() -> String
    func topTracks(artistId: String) -> String
}
