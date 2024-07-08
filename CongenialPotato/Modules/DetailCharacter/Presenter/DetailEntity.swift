//
//  DetailEntity.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

enum DetailSectionType: Int, CaseIterable {
    case photo
    case information
}

enum DetailInfoType: String, CaseIterable {
    case status
    case gender
    case type
    case species
    
    var tintColor: UIColor {
        switch self {
            case .status:
                return .systemBlue
            case .gender:
                return .systemRed
            case .type:
                return .systemPurple
            case .species:
                return .systemGreen
        }
    }
    
    var iconImage: UIImage? {
        switch self {
            case .status, .gender, .type, .species:
                return UIImage(systemName: "bell")
        }
    }
    
    var displayTitle: String {
        switch self {
            case .status, .gender, .type, .species:
                return rawValue.uppercased()
        }
    }
}
