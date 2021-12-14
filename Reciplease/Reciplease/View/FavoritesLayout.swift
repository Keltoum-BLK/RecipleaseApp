//
//  FavoritesLayout.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import Foundation
import UIKit

class FavoritesLayout {
    
    static var shared = FavoritesLayout()
    
    func addTabViewConstraints(tabView: UITableView, vc : UIView) {
        tabView.centerXAnchor.constraint(equalTo: vc.centerXAnchor).isActive = true
        tabView.centerYAnchor.constraint(equalTo: vc.centerYAnchor).isActive = true
    }
    
}
