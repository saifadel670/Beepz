//
//  UIViewController+Extensions.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
