//
//  StringExtension.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

extension String {
    
    var toBase64: String {
        return Data(self.utf8).base64EncodedString()
    }
}
