//
//  FirebaseService.swift
//  CongenialPotato
//
//  Created by CT4TuEI3 on 08.07.2024.
//


import FirebaseRemoteConfig

protocol FirebaseServiceProtocol {
    func isNeedForceUpdate(success: @escaping (Bool) -> Void,
                           failure: @escaping (String?) -> Void)
}

final class FirebaseService: FirebaseServiceProtocol {
    
    // MARK: - Private properties

    private let remoteConfig = RemoteConfig.remoteConfig()
    
    
    // MARK: - Methods

    func isNeedForceUpdate(success: @escaping (Bool) -> Void, failure: @escaping (String?) -> Void) {
        remoteConfig.fetch { [weak self] status, error in
            guard let self else { return }
            if status == .success {
                self.remoteConfig.activate { _, _ in
                    let isNeedForceUpdate = self.remoteConfig[Configure.remoteConfigKey].boolValue
                    success(isNeedForceUpdate)
                }
            } else {
                failure(error?.localizedDescription)
            }
        }
    }
}
