//
//  NetworkService.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import Foundation

protocol NetworkServiceProtocol {
    func getCharacters(success: @escaping (CharactersResponse) -> Void,
                       failure: @escaping (String?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func getCharacters(success: @escaping (CharactersResponse) -> Void,
                       failure: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard let data, error == nil else {
                failure(error?.localizedDescription)
                return
            }
            do {
                let allCharactersData = try JSONDecoder().decode(CharactersResponse.self, from: data)
                success(allCharactersData)
            } catch {
                failure("Error parsing 👺")
            }
        }.resume()
    }
}
