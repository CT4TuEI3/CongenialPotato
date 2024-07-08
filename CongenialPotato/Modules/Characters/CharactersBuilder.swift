// 
//  CharactersBuilder.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class CharactersBuilder {
    static func createCharactersModule() -> UIViewController {
        let view = CharactersViewController()
        let networkService = NetworkService()
        let presenter = CharactersPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
