//
//  SearchMainView.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 19/12/2021.
//

protocol SearchMainViewDelegate: AnyObject {
    func addIngredient()
    func clearIngredientList()
    func searchRecipes()
}
import UIKit

class SearchMainView: UIView {
    //Delegate
    weak var delegate: SearchMainViewDelegate?
  
   
    //Properties
    var ingredient = String()
    var elements: [String] {
        return ingredient.split(separator: ",").map {
            "\($0)" }
    }
    
    //Inits 
    override init(frame: CGRect) {
        super.init(frame: frame)
            configureSubviews()
            setButtonsTarget()
            setTitleContainerConstraints()
            setTabViewConstraints()
            setSearchBTNContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            configureSubviews()
    }
    
    
    //MARK: UI Properties
    private lazy var addIngredientContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.recipleasePantone(color: .whiteReciplease)
        container.addSubview(sContainer)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var sContainer: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 10
        s.addArrangedSubview(questionLabel)
        s.addArrangedSubview(addStack)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    private lazy var questionLabel: UILabel = {
        let question = UILabel()
        question.text = "What's in your fridge?"
        question.font = UIFont.chalkboard(fontSize: 25)
        question.textColor = .black
        question.textAlignment = .center
        question.translatesAutoresizingMaskIntoConstraints = false
        return question
    }()
    
    lazy var addIngredientTextField: UITextField = {
        let textField = UITextField()
        textField.text = ingredient
        textField.textColor = .black
        textField.keyboardType = .twitter
        textField.font = UIFont.chalkboard(fontSize: 20)
        textField.changeThePLaceholderFont(text: "Lemon, Cheese, Sausages...", textField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var addBTN: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.recipleasePantone(color: .greenReciplease)
        btn.setTitle("Add", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var addStack: UIStackView = {
        let addStack = UIStackView()
        addStack.axis = .horizontal
        addStack.distribution = .fillProportionally
        addStack.alignment = .center
        addStack.spacing = 0
        addStack.addArrangedSubview(addIngredientTextField)
        addStack.addArrangedSubview(addBTN)
        addStack.translatesAutoresizingMaskIntoConstraints = false
        return addStack
    }()
    
     lazy var headerTabView: UIStackView = {
        let addStack = UIStackView()
        addStack.axis = .horizontal
        addStack.distribution = .fillProportionally
        addStack.alignment = .center
        addStack.spacing = 0
        addStack.addArrangedSubview(ingredientsListLabel)
        addStack.addArrangedSubview(clearBTN)
        addStack.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        addStack.translatesAutoresizingMaskIntoConstraints = false
        return addStack
    }()
    private lazy var ingredientsListLabel: UILabel = {
        let info = UILabel(frame: CGRect())
        info.text = "Your Ingredients: "
        info.font = UIFont.chalkduster(fontSize: 20)
        info.textColor = .white
        info.textAlignment = .left
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    private lazy var clearBTN: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("Clear", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var ingredientsTabView: UITableView = {
        let ingredients = UITableView()
        ingredients.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        return ingredients
    }()
    
    private lazy var searchBTN: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.recipleasePantone(color: .greenReciplease)
        btn.titleLabel?.font = UIFont.chalkduster(fontSize: 30)
        btn.setTitle("Search", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    //MARK: Methods to add to the MainView
    func configureSubviews() {
        backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        let subviews = [addIngredientContainer, headerTabView, ingredientsTabView, searchBTN]
        for view in subviews {
            addSubview(view)
        }
    }
    
    //MARK: Targets
    private func setButtonsTarget() {
        addBTN.addTarget(self, action: #selector(addIngredientBTNAction), for: .touchUpInside)
        clearBTN.addTarget(self, action: #selector(clearIngredientList), for: .touchUpInside)
        searchBTN.addTarget(self, action: #selector(searchRecipes), for: .touchUpInside)
    }
    
    @objc private func addIngredientBTNAction() {
            delegate?.addIngredient()
    }
    @objc private func clearIngredientList() {
        delegate?.clearIngredientList()
    }
    @objc private func searchRecipes() {
        delegate?.searchRecipes()
    }
    
}
//MARK: Constraints
extension SearchMainView {


    private func setTitleContainerConstraints() {
        addIngredientContainer.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        addIngredientContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20).isActive = true
        addIngredientContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        addIngredientContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        addIngredientContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sContainer.centerYAnchor.constraint(equalTo: addIngredientContainer.centerYAnchor).isActive = true
        sContainer.centerXAnchor.constraint(equalTo: addIngredientContainer.centerXAnchor).isActive = true
        sContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        addBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setTabViewConstraints() {
        //set Header Constraints
        headerTabView.topAnchor.constraint(equalTo: addIngredientContainer.bottomAnchor, constant: 10).isActive = true
        headerTabView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06).isActive = true
        headerTabView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        headerTabView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        clearBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //set table view's constraints
        ingredientsTabView.topAnchor.constraint(equalTo: headerTabView.bottomAnchor, constant: 0).isActive = true
        ingredientsTabView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.42 ).isActive = true
        ingredientsTabView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        ingredientsTabView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    //
   private func setSearchBTNContraints() {
        searchBTN.topAnchor.constraint(equalTo: ingredientsTabView.bottomAnchor, constant: 15).isActive = true
        searchBTN.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08 ).isActive = true
        searchBTN.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        searchBTN.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
}


