//
//  SearchingViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class SearchingVC: UIViewController {
    //MARK: Properties
    var ingredientArray = [String]()
    
    //MARK: UI Properties
    private lazy var sContainer: UIStackView = {
        let s = UIStackView(frame: CGRect(x: 10, y: 50, width: view.frame.size.width-20, height: 100))
        s.axis = .vertical
        s.spacing = 0
        s.addArrangedSubview(questionLabel)
        s.addArrangedSubview(addStack)
        return s
    }()
    
    private lazy var addIngredientContainer: UIView = {
        let container = UIView(frame: CGRect(x: 0, y: 50, width: view.frame.size.width, height: 170))
        container.backgroundColor = UIColor(.white)
        container.addSubview(sContainer)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var ingredientsTabView: UITableView = {
        let ingredients = UITableView(frame: CGRect(x: 0, y: 280, width: view.frame.size.width, height: view.frame.size.height-450))
        ingredients.backgroundColor = UIColor.blue
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        
        return ingredients
    }()
    
    private lazy var questionLabel: UILabel = {
        let question = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.size.width, height: 50))
        question.text = "What's in your fridge?"
        question.font = UIFont(name: "chalkboard SE", size: 25)
        question.textColor = .black
        question.textAlignment = .center
        return question
    }()
    
    private lazy var addIngredientTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont(name: "chalkboard SE", size: 20)
        textField.changeThePLaceholderFont(text: "Lemon, Cheese, Sausages...", textField: textField)
        return textField
    }()
    
    private lazy var addBTN: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 0))
        btn.backgroundColor = UIColor(red: 43/255, green: 95/255, blue: 59/255, alpha: 1)
        btn.setTitle("Add", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private lazy var addStack: UIStackView = {
        let addStack = UIStackView(frame: CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 60))
        addStack.axis = .horizontal
        addStack.distribution = .fillProportionally
        addStack.alignment = .center
        addStack.spacing = 0
        addStack.addArrangedSubview(addIngredientTextField)
        addStack.addArrangedSubview(addBTN)
        return addStack
    }()
    
    private lazy var headerTabView: UIStackView = {
        let addStack = UIStackView(frame: CGRect(x: 10, y: 220, width: view.frame.size.width-20, height: 60))
        addStack.axis = .horizontal
        addStack.distribution = .fillProportionally
        addStack.alignment = .center
        addStack.spacing = 0
        addStack.addArrangedSubview(ingredientsListLabel)
        addStack.addArrangedSubview(clearBTN)
        return addStack
    }()
    private lazy var ingredientsListLabel: UILabel = {
        let question = UILabel(frame: CGRect())
        question.text = "Your Ingredients: "
        question.font = UIFont(name: "chalkduster", size: 20)
        question.textColor = .white
        question.textAlignment = .left
        return question
    }()
    
    private lazy var clearBTN: UIButton = {
        let btn = UIButton(frame: CGRect())
        btn.backgroundColor = UIColor.gray
        btn.setTitle("Clear", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private lazy var searchBTN: UIButton = {
        let btn = UIButton(frame: CGRect(x: 40, y: view.frame.size.height-145, width: view.frame.size.width-80, height: 60))
        btn.backgroundColor = UIColor(red: 43/255, green: 95/255, blue: 59/255, alpha: 1)
        btn.setTitle("Search", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTabView.delegate = self
        ingredientsTabView.dataSource = self
        ingredientsTabView.reloadData()
        view.addSubview(addIngredientContainer)
        view.addSubview(headerTabView)
        view.addSubview(ingredientsTabView)
        view.addSubview(searchBTN)
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clearBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true 
    }
    
    
    func addIngredient() {
        addBTN.target(forAction: #selector(addToTheList), withSender: addBTN)
    }
    
    @objc func addToTheList() {
        guard let ingredient = addIngredientTextField.text else { return }
        SearchVCActions.shared.addIngredient(ingredient: ingredient, array: ingredientArray)
    }

}

extension SearchingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
        cell.textLabel?.text = ingredientArray[indexPath.row]
        return cell
    }

}
