//
//  CircleImageView.swift
//  Beepz
//
//  Created by Saif Adel on 26/01/2022.
//

import UIKit

class CircleImageView: UIImageView {

    @IBInspectable var isCircle: Bool = false {
        didSet {
            layer.cornerRadius = self.frame.size.width/2
        }
    }

}
