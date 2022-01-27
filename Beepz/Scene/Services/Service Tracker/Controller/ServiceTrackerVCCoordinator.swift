//
//  ServiceTrackerVCCoordinator.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import Foundation
import RxCocoa

final class ServiceTrackerVCCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let info: ServiceModel.ServiceTrackerModel
    
    init(navigationController: UINavigationController,info: ServiceModel.ServiceTrackerModel) {
        self.navigationController = navigationController
        self.info = info
    }
    
    public func start() {
        let serviceTrackerVC: ServiceTrackerVC = .instantiate()
        serviceTrackerVC.viewModel.info.accept(self.info)
        serviceTrackerVC.coordinator = self
        navigationController.pushViewController(serviceTrackerVC, animated: true)
    }
    
    public func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
}

