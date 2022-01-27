//
//  ServicesVCCoordinator.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import UIKit

final class ServicesVCCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let controller: ServicesVC = .instantiate()
        controller.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    public func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    public func presentServiceTracker(_ model: ServiceModel.ServiceTrackerModel){
        sanityCheck()
        let serviceTrackerVCCoordinator = ServiceTrackerVCCoordinator(navigationController: navigationController, info: model)
        navigationController.delegate = self
        childCoordinators.append(serviceTrackerVCCoordinator)
        serviceTrackerVCCoordinator.start()
    }
    
}

//MARK:- remove child

extension ServicesVCCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if let vc = fromViewController as? ServiceTrackerVC {
            print("removeChildCoordinator:-",vc)
            removeChildCoordinator(vc.coordinator!)
        }
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}

extension ServicesVCCoordinator {
    func sanityCheck() {
        print("children:-",childCoordinators)
        precondition(childCoordinators.isEmpty, "Children should always be empty")
    }
}


