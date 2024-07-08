//
//  CharacterInfoCellModel.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 08.07.2024.
//


import Foundation

final class CharacterInfoCellModel {
    
    // MARK: - Public properties
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue: String {
        if value.isEmpty { return "None" }
        return value
    }
    
    
    // MARK: - Private properties
    
    private let type: DetailInfoType
    private let value: String
    
    
    // MARK: - Lifecycle
    
    init(type: DetailInfoType, value: String) {
        self.value = value
        self.type = type
    }
    
}
