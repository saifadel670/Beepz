//
//  CustomTableView.swift
//  Beepz
//
//  Created by Saif Adel on 26/01/2022.
//


import UIKit

@IBDesignable
final class CustomTableView: UITableView {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0

    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
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
