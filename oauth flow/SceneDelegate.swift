//
//  SceneDelegate.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dependencyContainer = AppDependencyContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainVC = dependencyContainer.createMainViewController()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }

}

