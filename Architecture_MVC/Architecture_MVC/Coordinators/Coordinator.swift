//
//  Coordinator.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

protocol Coordinator {
//    variables opcionales usara cualquiera de las dos
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
//    método que realizará la navegación
    func start()
    
}

extension Coordinator {
//    damos un valor por defecto a las variables y el tipo que conforme 'Coordinator' podra dar un valor de instancia a una de ellas
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
