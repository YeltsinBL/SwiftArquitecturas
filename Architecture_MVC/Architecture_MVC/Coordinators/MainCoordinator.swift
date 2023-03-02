//
//  MainCoordinator.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
//    requisito del protocolo
    var navigationController: UINavigationController?
    
//    creamos el inicializador y le inyectamos el 'NavigationController'
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        instancia del Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        instancia del ViewController y el identificador para el 'Main.storyboard'
        let listOfCharacterViewController = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController")
        
//        realizamos el push
        navigationController?.pushViewController(listOfCharacterViewController, animated: true)
        
    }
    
    
}
