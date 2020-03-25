//
//  SceneDelegate.swift
//  MusicApp
//
//  Created by Marcio Habigzang Brufatto on 25/03/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let auth = Auth(network: Network(), urlsApi: UrlsApi())
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        mainScreen(scene)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        if (url.host == "callback") {
            print("Entrou Aqui")
            self.auth.getToken(url: url) {
                self.mainScreen(scene)
            }
        }
    }
    
    private func mainScreen(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
        self.window?.rootViewController = auth.isLogged() ? loginScreen(storyboard) : artistsList(storyboard)
        self.window?.makeKeyAndVisible()
    }
    
    private func loginScreen(_ storyboard: UIStoryboard) -> UINavigationController{
        guard let rootVC = storyboard.instantiateViewController(identifier: "ListArtistsViewController") as? ListArtistsViewController else {
            print("ViewController not found")
            return UINavigationController()
        }
        return UINavigationController(rootViewController: rootVC)
    }
    
    private func artistsList(_ storyboard: UIStoryboard) -> UINavigationController {
        guard let rootVC = storyboard.instantiateViewController(identifier: "LoginViewController") as? ViewController else {
            print("ViewController not found")
            return UINavigationController()
        }
        return UINavigationController(rootViewController: rootVC)
    }
}

