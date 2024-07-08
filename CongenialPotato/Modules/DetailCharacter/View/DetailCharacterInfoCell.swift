//
//  DetailCharacterInfoCell.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class DetailCharacterInfoCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()

    private let titleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
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
        valueLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLabel.textColor = .label
    }

    
    // MARK: - Configure

    func configure(_ character: DetailInfoType, values: CharacterInfoCellModel) {
        titleLabel.text = character.displayTitle
        valueLabel.text = values.displayValue
        iconImageView.image = character.iconImage
        iconImageView.tintColor = character.tintColor
        titleLabel.textColor = character.tintColor
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(titleContainerView, valueLabel, iconImageView)
        titleContainerView.addSubview(titleLabel)
        setupConstraints()
    }
}


// MARK: - Constraints

private
extension DetailCharacterInfoCell {
    func setupConstraints() {
        titleContainerView.snp.makeConstraints { make in
            make.height.equalTo(contentView.snp.height).multipliedBy(0.33)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.top.equalToSuperview().inset(32)
            make.leading.equalToSuperview().inset(24)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalTo(titleContainerView.snp.top)
        }
    }
}
