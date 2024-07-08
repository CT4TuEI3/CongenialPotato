//
//  CharacterCell.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class CharacterCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
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
        nameLabel.text = nil
        statusLabel.text = nil
    }

    
    // MARK: - Configure

    func configure(_ character: CharacterModel) {
        guard let imageUrl = URL(string: character.image) else { return }
        imageView.imageFrom(url: imageUrl)
        nameLabel.text = character.name
        statusLabel.text = character.status.text
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        setupConstraints()
    }
}


// MARK: - Constraints

private
extension CharacterCell {
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).offset(-4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(statusLabel.snp.top)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
