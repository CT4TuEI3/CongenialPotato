//
//  CharacterModel.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import Foundation

struct CharactersResponse: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let image: String
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
