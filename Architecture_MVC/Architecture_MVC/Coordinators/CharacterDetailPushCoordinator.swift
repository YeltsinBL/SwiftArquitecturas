//
//  CharacterDetailPushCoordinator.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

class CharacterDetailPushCoordinator: Coordinator {
    
    let characterModel: CharacterModel
    var navigationController: UINavigationController?
    
    
    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
    
    
}
