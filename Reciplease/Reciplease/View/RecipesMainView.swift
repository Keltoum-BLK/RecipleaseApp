//
//  FavoritesLayout.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import Foundation
import UIKit

class RecipesMainView{
    
    static var shared = RecipesMainView()
    
    func addTabViewConstraints(tabView: UITableView, vc : UIView) {
        tabView.topAnchor.constraint(equalTo: vc.topAnchor, constant: 100).isActive = true
        tabView.bottomAnchor.constraint(equalTo: vc.bottomAnchor, constant: 100).isActive = true
        tabView.widthAnchor.constraint(equalTo: vc.widthAnchor, multiplier: 1).isActive = true
       
    }
    
}
