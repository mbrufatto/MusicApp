//
//  TokenResponse.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

struct TokenResponse: Codable {
    let refresh_token: String?
    let scope: String
    let token_type: String
    let access_token: String
    let expires_in: Int
}
