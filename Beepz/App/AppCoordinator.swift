//
//  AppCoordinator.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import Foundation
import UIKit


final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let navigationController = UINavigationController()
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let coordinator = ServicesVCCoordinator(navigationController: navigationController)
        coordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

