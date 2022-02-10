//
//  SearchingViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class SearchingVC: UIViewController {
    
    //MARK: Properties
    lazy var ingredientArray = [String]()
    lazy var recipeSearch = [Recipe]()
    
    //MARK: UI Properties
    private let searchMainView = SearchMainView()
    private var count: Int = 0
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchMainView
        searchMainView.delegate = self
        searchMainView.ingredientsTabView.delegate = self
        searchMainView.ingredientsTabView.dataSource = self
        navigationItem.backButtonTitle = "Back"
    }
}

extension SearchingVC: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = ingredientArray[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.text = item
        cell.textLabel?.font = UIFont.chalkduster(fontSize: 20)
        cell.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        cell.textLabel?.textColor = UIColor.recipleasePantone(color: .whiteReciplease)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            ingredientArray.remove(at: indexPath.row)
            searchMainView.ingredientsTabView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension SearchingVC: SearchMainViewDelegate {
    //MARK: Methods SearchMainViewDelegate
    func clearIngredientList() {
        ingredientArray = BTNActions.shared.clearIngredientList(list: ingredientArray, vc: self)
        searchMainView.ingredientsTabView.reloadData()
    }
    
    func searchRecipes() {
        guard let navigation = self.navigationController else { return }
        count = BTNActions.shared.searchBTNIsAlreadyTap(alreadyTap: count, vc: self)
        BTNActions.shared.searchRecipes(ingredientArray: ingredientArray, navigationController: navigation, vc: self)
    }
    
    func addIngredient() {
        view.endEditing(true)
        guard let text = searchMainView.addIngredientTextField.text else { return }
        let ingredients = BTNActions.shared.addIngredient(ingredient: text, vc: self)
        ingredientArray = Tool.shared.notDuplicateIngredients(ingredients: ingredients)
        searchMainView.addIngredientTextField.text = nil
        searchMainView.ingredientsTabView.reloadData()
    }
}
