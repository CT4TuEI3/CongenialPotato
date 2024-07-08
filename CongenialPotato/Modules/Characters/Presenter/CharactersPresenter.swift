//
//  CharactersPresenter.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import Foundation

protocol CharactersViewControllerProtocol: AnyObject {
    func setCharacters(_ characters: [CharacterModel])
}

protocol CharactersPresenterProtocol {
    func getCharacters()
}

final class CharactersPresenter {
    
    // MARK: - Private properties
    
    private weak var view: CharactersViewControllerProtocol?
    private let networkService: NetworkServiceProtocol?
    
    
    // MARK: - Lifecycle
    
    init(view: CharactersViewControllerProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}


// MARK: - CharactersPresenterProtocol

extension CharactersPresenter: CharactersPresenterProtocol {
    func getCharacters() {
        networkService?.getCharacters(success: { characters in
            self.view?.setCharacters(characters.results)
        }, failure: { errorDescription in
            print("🛑", errorDescription as Any)
        })
    }
}
