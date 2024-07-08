// 
//  DetailCharacterViewController.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

final class DetailCharacterViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: DetailCharacterPresenterProtocol?
    
    
    // MARK: - Private properties
    
    private var character: CharacterModel?
    private var detailValue: [CharacterInfoCellModel]?
    
    
    // MARK: - UI Elements
    
    private lazy var detailCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(DetailCharacterImageCell.self)
        collectionView.registerClass(DetailCharacterInfoCell.self)
        return collectionView
    }()

    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getCharacterDetail()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        view.addSubview(detailCollectionView)
        setupConstraints()
    }
}


// MARK: - DetailCharacterViewControllerProtocol

extension DetailCharacterViewController: DetailCharacterViewControllerProtocol {
    func showCharacterDetail(character: CharacterModel) {
        title = character.name
        self.character = character
        self.detailValue = [CharacterInfoCellModel(type: .status, value: character.status.rawValue),
                            CharacterInfoCellModel(type: .gender, value: character.gender.rawValue),
                            CharacterInfoCellModel(type: .type, value: character.type),
                            CharacterInfoCellModel(type: .species, value: character.species)]
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension DetailCharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DetailSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = DetailSectionType.allCases[section]
        switch sectionType {
            case .photo:
                return 1
            case .information:
                return DetailInfoType.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = DetailSectionType.allCases[indexPath.section]
        switch sectionType {
            case .photo:
                let cell = collectionView.dequeueReusableCellForIndexPath(indexPath) as DetailCharacterImageCell
                if let character {
                    cell.configure(character)
                }
                return cell
            case .information:
                let cell = collectionView.dequeueReusableCellForIndexPath(indexPath) as DetailCharacterInfoCell
                let infoView = DetailInfoType.allCases[indexPath.row]
                if let detailValue {
                    cell.configure(infoView, values: detailValue[indexPath.row])
                }
                return cell
        }
    }
}


// MARK: - Constraints

private
extension DetailCharacterViewController {
    func setupConstraints() {
        detailCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let sectionTypes = DetailSectionType.allCases[sectionIndex]
        switch sectionTypes {
            case .photo:
                return createPhotoSectionLayout()
            case .information:
                return createInfoSectionLayout()
        }
    }
    
    func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func createInfoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:  NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)
            ),
            subitems: [item, item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
