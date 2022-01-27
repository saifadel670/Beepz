//
//  TopLeftRightCustomCorner.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import UIKit

@IBDesignable
class TopLeftRightCustomCorner: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 20.0

    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundedCorners(corners: [.topLeft, .topRight], radius: cornerRadius)
    }
    
    func roundedCorners(corners : UIRectCorner, radius : CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
