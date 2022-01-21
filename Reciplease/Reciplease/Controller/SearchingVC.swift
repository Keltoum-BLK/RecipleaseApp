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
    var recipeSearch = [Recipe]()
    //MARK: UI Properties
    private let searchMainView = SearchMainView()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchMainView
        searchMainView.delegate = self
        searchMainView.ingredientsTabView.delegate = self
        searchMainView.ingredientsTabView.dataSource = self
        navigationItem.backButtonTitle = "Back"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        ingredientArray = BTNActions.shared.clearIngredientList(list: ingredientArray)
        searchMainView.ingredientsTabView.reloadData()
        print("cleared")
    }
    
    func searchRecipes() {
        print("search")
        if ingredientArray.count > 0 {
        EdamamApiService.shared.getTheHits(ingredients: ingredientArray) { result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                guard let hits = recipes.hits else { return }
                    if !hits.isEmpty {
                let recipesSearchVC = RecipesListViewController(recipesArray: hits)
                self.navigationController?.pushViewController(recipesSearchVC, animated: true)
                    } else {
                        AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients", vc: self)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                AlertManager.sharedAlert.alertServerAccess(title: "Server error appeared" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients", vc: self)
            }
        }
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Error Appeared", message: "You need to add ingredient to launch the research.", vc: self)
        }
        
    }
    
    func addIngredient() {
        print("add it")
        view.endEditing(true)
        if searchMainView.addIngredientTextField.text != "" {
            guard let text = searchMainView.addIngredientTextField.text else { return }
            let ingredients = BTNActions.shared.addIngredient(ingredient: text)
            ingredientArray = Tools.notDuplicateIngredients(ingredients: ingredients)
            searchMainView.addIngredientTextField.text = nil
            searchMainView.ingredientsTabView.reloadData()
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You can't add nothing. \n Please enter ingredients before", vc: self)
        }
        
    }
}
