//
//  Coordinator.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import Foundation

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get}
    func start()
    func popViewController()
    func sanityCheck()
}
extension Coordinator{
    func popViewController(){}
    func sanityCheck(){}
}
