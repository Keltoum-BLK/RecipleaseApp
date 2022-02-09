//
//  UIView + Extension.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 27/12/2021.
//

import Foundation
import UIKit

extension UIView{
    //MARK: methods to add Gradient Layer
    // For insert layer in background
    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = colors.map{$0.cgColor}
        gradient.locations = [0.5,1]
        self.layer.sublayers?.removeAll()
        gradient.removeFromSuperlayer()
        self.layer.insertSublayer(gradient, at: 0)
    }
}
