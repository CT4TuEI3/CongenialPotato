// 
//  DetailCharacterPresenter.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import Foundation

protocol DetailCharacterViewControllerProtocol: AnyObject {
    func showCharacterDetail(character: CharacterModel)
}

protocol DetailCharacterPresenterProtocol {
    func getCharacterDetail()
}

final class DetailCharacterPresenter {
    
    // MARK: - Private properties
    
    private weak var view: DetailCharacterViewControllerProtocol?
    private let character: CharacterModel
    
    
    // MARK: - Lifecycle
    
    init(view: DetailCharacterViewControllerProtocol, character: CharacterModel) {
        self.view = view
        self.character = character
    }
}


// MARK: - DetailCharacterPresenterProtocol

extension DetailCharacterPresenter: DetailCharacterPresenterProtocol {
    func getCharacterDetail() {
        view?.showCharacterDetail(character: character)
    }
}
