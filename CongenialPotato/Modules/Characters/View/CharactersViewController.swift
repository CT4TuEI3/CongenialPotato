//
//  CharactersViewController.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit
import SnapKit

final class CharactersViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: CharactersPresenterProtocol?
    
    
    // MARK: - Private properties
    
    private var characters: [CharacterModel] = []
    
    
    // MARK: - UI Elements
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(CharacterCell.self)
        return collectionView
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getCharacters()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainCollectionView)
        setupConstraints()
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CharactersViewController: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellForIndexPath(indexPath) as CharacterCell
        cell.configure(characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let vc = DetailCharacterBuilder.createDetailCharacterModule(character: character)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = (bounds.width - 30) / 2
        
        return CGSize(width: width, height: width * 1.5)
    }
}


// MARK: - CharactersViewControllerProtocol

extension CharactersViewController: CharactersViewControllerProtocol {
    func setCharacters(_ characters: [CharacterModel]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
}


// MARK: - Constraints

private
extension CharactersViewController {
    func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
