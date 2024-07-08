//
//  SceneDelegate.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit
import FirebaseRemoteConfig

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    // MARK: - Private properties
    
    private let firebaseService = FirebaseService()
    
    
    // MARK: -
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        firebaseService.isNeedForceUpdate { isNeedUpdate in
            isNeedUpdate ? self.showNeedUpdateScreen() : self.showMainScreen()
        } failure: { errorMessage in
            print(errorMessage ?? "🛑 Error")
        }
    }
    
    
    // MARK: - Private methods
    
    private func showMainScreen() {
        DispatchQueue.main.async {
            self.window?.rootViewController = MainTabBarController()
        }
    }
    
    private func showNeedUpdateScreen() {
        DispatchQueue.main.async {
            self.window?.rootViewController = FireBaseScreen()
        }
    }
}
