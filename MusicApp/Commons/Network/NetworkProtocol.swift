//
//  NetworkProtocol.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Alamofire

protocol NetworkProtocol: class {
    func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
    func requestToken(url: String, code: String, type: TokenRequestType, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
}
