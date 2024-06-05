//
//  SceneDelegate.swift
//  SwiftTasksForInterview
//
//  Created by Levon Shaxbazyan on 04.06.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = AsyncWorker()
        window.makeKeyAndVisible()
        self.window = window
    }
}

