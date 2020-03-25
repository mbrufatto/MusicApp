//
//  AuthProtocol.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

protocol AuthProtocol: class {
  func getToken(url: URL, success: @escaping () -> Void)
  func validateToken(success: @escaping () -> Void, failure: @escaping (String) -> Void)
  func isLogged() -> Bool
}
