//
//  CustomUIView.swift
//  Beepz
//
//  Created by Saif Adel on 26/01/2022.
//

import UIKit

class CustomUIView: UIView {
   
    @IBInspectable var cornerRadius: CGFloat = 10.0
    @IBInspectable var shadowColor: UIColor = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowOffset : CGSize = .zero
    @IBInspectable var shadowRadius: CGFloat = 3
  
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius =  cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        layer.masksToBounds = false
    }
}
