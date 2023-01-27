//
//  SceneDelegate.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/23/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        guard let loginSceneController = SceneBuilder.createLoginScene(with: StudentsGroupModel()) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = loginSceneController
        window?.makeKeyAndVisible()
    }
}
