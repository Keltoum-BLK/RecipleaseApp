//
//  RecipeDetailsMainView.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 22/12/2021.
//

import Foundation
import UIKit

class RecipeDetailsMainView: UIView {
    
   lazy var recipeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "chalkduster", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var ingredientsTitle: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.textAlignment = .center
         label.font = UIFont(name: "chalkduster", size: 25)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var ingredientsList: UITextView = {
        let list = UITextView()
        list.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        list.font = UIFont.chalkduster(fontSize: 20)
        list.textColor = .recipleasePantone(color: .whiteReciplease)
        return list
    }()
    
    
    lazy var directionsBTN: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.chalkboard(fontSize: 30)
        btn.tintColor = UIColor.recipleasePantone(color: .whiteReciplease)
        btn.backgroundColor = .recipleasePantone(color: .greenReciplease)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }

    private func configureSubviews() {
        addSubview(recipeTitle)
        backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
    }
    
    func setUpContraints() {
        recipeTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        recipeTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        recipeTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
 
    
   
    
}

