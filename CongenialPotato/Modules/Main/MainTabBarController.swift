//
//  ViewController.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    
    // MARK: - Private methods
    
    private func setupViewControllers() {
        let charactersVC = CharactersBuilder.createCharactersModule()
        let locationsVC = LocationsViewController()
        let episodesVC = EpisodesViewController()
        let settingsVC = SettingsViewController()
        setViewControllers([createNav(title: "Characters",
                                      image: UIImage(systemName: "person"),
                                      vc: charactersVC),
                            createNav(title: "Locations",
                                      image: UIImage(systemName: "globe"),
                                      vc: locationsVC),
                            createNav(title: "Episodes",
                                      image: UIImage(systemName: "tv"),
                                      vc: episodesVC),
                            createNav(title: "Settings",
                                      image: UIImage(systemName: "gear"),
                                      vc: settingsVC)], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
