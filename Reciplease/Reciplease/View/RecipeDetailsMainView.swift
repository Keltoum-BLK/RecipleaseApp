//
//  RecipeDetailsMainView.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 22/12/2021.
//

import Foundation
import UIKit

protocol RecipeDetailsDelegate: AnyObject {
    func nextView()
}

class RecipeDetailsMainView: UIView {
    //MARK: Properties
    weak var delegate: RecipeDetailsDelegate?
    
    
    //MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setButtonsTarget()
        layoutSubviews()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        recipeImage.addBlackGradientLayerInBackground(frame: recipeImage.frame, colors: [UIColor(.clear), UIColor.recipleasePantone(color: .chalkBoardBackground)])
    }
    
    //MARK: Subviews
    lazy var recipeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.chalkboard(fontSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RecipeCellImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var addStack: UIStackView = {
        let addStack = UIStackView()
        addStack.axis = .vertical
        addStack.distribution = .fill
        addStack.alignment = .center
        addStack.spacing = 5
        addStack.addArrangedSubview(recipeTitle)
        addStack.addArrangedSubview(ingredientsTitle)
        addStack.addArrangedSubview(ingredientsList)
        addStack.addArrangedSubview(directionsBTN)
        addStack.backgroundColor = .clear
        addStack.translatesAutoresizingMaskIntoConstraints = false
        return addStack
    }()
    
    lazy var ingredientsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Your ingredients: "
        label.font = UIFont.chalkboard(fontSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ingredientsList: UITextView = {
        let list = UITextView()
        list.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        list.font = UIFont.chalkboard(fontSize: 20)
        list.textColor = .recipleasePantone(color: .whiteReciplease)
        list.translatesAutoresizingMaskIntoConstraints = false
        return list
    }()
    
    
    lazy var directionsBTN: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.chalkboard(fontSize: 30)
        btn.setTitle("Get directions", for: .normal)
        btn.backgroundColor = .recipleasePantone(color: .greenReciplease)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private func configureSubviews() {
        addSubview(recipeTitle)
        addSubview(recipeImage)
        addSubview(addStack)
        backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
    }
    
    //MARK: Targets
    private func setButtonsTarget() {
        directionsBTN.addTarget(self, action: #selector(getDirections), for: .touchUpInside)
    }
    
    @objc private func getDirections() {
        delegate?.nextView()
    }
  
}

extension RecipeDetailsMainView {
    
    //MARK: Constraints
    private func setUpContraints() {
        recipeImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        recipeImage.topAnchor.constraint(equalTo: topAnchor, constant: 55).isActive = true
        recipeImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
        recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        recipeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        addStack.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: -35).isActive = true
        addStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.97).isActive = true
        addStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.49).isActive = true
        
        ingredientsTitle.widthAnchor.constraint(equalTo: addStack.widthAnchor, multiplier: 0.9).isActive = true
        ingredientsList.widthAnchor.constraint(equalTo: addStack.widthAnchor, multiplier: 0.9).isActive = true
        directionsBTN.heightAnchor.constraint(equalToConstant: 60).isActive = true
        directionsBTN.widthAnchor.constraint(equalTo: addStack.widthAnchor, multiplier: 0.9).isActive = true
        directionsBTN.centerXAnchor.constraint(equalTo: addStack.centerXAnchor).isActive = true
    }
}

