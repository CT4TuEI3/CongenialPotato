//
//  FireBaseScreen.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 08.07.2024.
//


import UIKit

final class FireBaseScreen: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update now", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(updateButton)
        
        updateButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
    
    
    // MARK: - Actions

    @objc
    private func updateButtonPressed() {
        print(#function)
    }
}
