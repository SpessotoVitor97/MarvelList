//
//  SceneDelegate.swift
//  Marvel
//
//  Created by Vitor Spessoto on 07/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: HerosListViewController())

            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

