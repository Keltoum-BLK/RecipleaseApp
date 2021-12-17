//
//  SearchingViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class SearchingVC: UIViewController {
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
        let ingredients = UITableView(frame: CGRect(x: 0, y: 280, width: view.frame.size.width, height: view.frame.size.height/3))
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
    
    private lazy var addTextField: UITextField = {
        let textField = UITextField()
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
        addStack.addArrangedSubview(addTextField)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addIngredientContainer)
        view.addSubview(headerTabView)
        view.addSubview(ingredientsTabView)
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clearBTN.widthAnchor.constraint(equalToConstant: 100).isActive = true 
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
