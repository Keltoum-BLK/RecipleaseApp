//
//  FavoritesLayout.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import Foundation
import UIKit

class RecipesMainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addTabViewConstraints()
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    
    lazy var recipesTabView: UITableView = {
       let tabView = UITableView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        return tabView
    }()

    
    func addTabViewConstraints() {
        recipesTabView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        recipesTabView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        recipesTabView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        recipesTabView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        recipesTabView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func configureSubviews() {
        addSubview(recipesTabView)
        backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
    }
    
}
