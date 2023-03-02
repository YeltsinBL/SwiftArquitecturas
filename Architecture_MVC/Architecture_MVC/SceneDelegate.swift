//
//  SceneDelegate.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
//        implementamos el Coordinator para que cargue el 'MainCoordinator' cuando se inicialice la aplicación
        window = UIWindow(windowScene: scene) //instancia del UIWindow pasando la escena en donde estamos
//        instancia del NavigationController porque lo necesita el MainCoordinator para el push de navegación
        let navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: navigationController)
        
        window?.rootViewController = navigationController // indicamos que el root es el NavigationController
        window?.makeKeyAndVisible() //crea una clave y lo hace visible
        
        mainCoordinator?.start()// realiza la navegación
        
    }

}

