// 
//  DetailCharacterBuilder.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class DetailCharacterBuilder {
    static func createDetailCharacterModule(character: CharacterModel) -> UIViewController {
        let view = DetailCharacterViewController()
        let presenter = DetailCharacterPresenter(view: view, character: character)
        view.presenter = presenter
        return view
    }
}
