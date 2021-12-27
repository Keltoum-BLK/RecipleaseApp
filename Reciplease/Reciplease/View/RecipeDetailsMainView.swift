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
    
    private lazy var likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "hand.thumbsup.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = .recipleasePantone(color: .whiteReciplease)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var timeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.contentMode = .scaleAspectFill
        image.tintColor = .recipleasePantone(color: .whiteReciplease)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var likeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.chalkboard(fontSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var timeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0m"
        label.textAlignment = .center
        label.font = UIFont.chalkboard(fontSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var viewStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        stack.addArrangedSubview(recipeTitle)
        stack.addArrangedSubview(ingredientsTitle)
        stack.addArrangedSubview(ingredientsList)
        stack.addArrangedSubview(directionsBTN)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    private lazy var likeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.layer.cornerRadius = 20
        stack.addArrangedSubview(likeTitle)
        stack.addArrangedSubview(likeImage)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private lazy var timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.addArrangedSubview(timeTitle)
        stack.addArrangedSubview(timeImage)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        stack.addArrangedSubview(likeStack)
        stack.addArrangedSubview(timeStack)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var infoView: UIView = {
       let container = UIView()
        container.addSubview(infoStack)
        container.layer.cornerRadius = 20
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.recipleasePantone(color: .grayReciplease).cgColor
        container.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private func configureSubviews() {
        addSubview(recipeTitle)
        addSubview(recipeImage)
        addSubview(infoView)
        bringSubviewToFront(infoView)
        addSubview(viewStack)
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
        
        viewStack.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: -35).isActive = true
        viewStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.97).isActive = true
        viewStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.49).isActive = true
        
        infoStack.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoStack.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: recipeImage.centerYAnchor, constant: -50).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        infoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        infoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        
        ingredientsTitle.widthAnchor.constraint(equalTo: viewStack.widthAnchor, multiplier: 0.9).isActive = true
        ingredientsList.widthAnchor.constraint(equalTo: viewStack.widthAnchor, multiplier: 0.9).isActive = true
        directionsBTN.heightAnchor.constraint(equalToConstant: 50).isActive = true
        directionsBTN.widthAnchor.constraint(equalTo: viewStack.widthAnchor, multiplier: 0.8).isActive = true
        directionsBTN.centerXAnchor.constraint(equalTo: viewStack.centerXAnchor).isActive = true
    }
}

