//
//  DetailCharacterImageCell.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class DetailCharacterImageCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    
    // MARK: - Configure
    
    func configure(_ character: CharacterModel) {
        guard let imageUrl = URL(string: character.image) else { return }
        imageView.imageFrom(url: imageUrl)
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.addSubview(imageView)
        setupConstraints()
    }
}


// MARK: - Constraints

private
extension DetailCharacterImageCell {
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
