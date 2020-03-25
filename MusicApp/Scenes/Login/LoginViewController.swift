//
//  LoginViewController.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let authURL = URL(string: "https://accounts.spotify.com/authorize?client_id=1a5f3e7c48524ed58a070b15be320890&response_type=code&redirect_uri=topartists://callback&scope=user-top-read")!
        UIApplication.shared.open(authURL, options: [:], completionHandler: nil)
        self.loginButton.setTitle("Wait...", for: .normal)
    }
}
