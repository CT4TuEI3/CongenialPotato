//
//  UICollectionViewExtension.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 07.07.2024.
//


import UIKit

extension UICollectionView {
    func registerClass<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCellForIndexPath<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
