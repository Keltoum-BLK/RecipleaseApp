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
    private let searchMainView = SearchMainView()

    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = ingredientArray[indexPath.row]
        cell.textLabel?.text = item
        cell.textLabel?.font = UIFont.chalkduster(fontSize: 20)
        cell.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        cell.textLabel?.textColor = UIColor.recipleasePantone(color: .whiteReciplease)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            ingredientArray.remove(at: indexPath.row)
            searchMainView.ingredientsTabView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
}

extension SearchingVC: SearchMainViewDelegate {
    //Methods SearchMainViewDelegate
    func clearIngredientList() {
        ingredientArray = SearchBTNTargets.shared.clearIngredientList(list: ingredientArray)
        searchMainView.ingredientsTabView.reloadData()
        print("cleared")
    }
    
    func searchRecipes() {
        print("search")
        navigationController?.pushViewController(FavoriteVC(), animated: true)
    }
    
    func addIngredient() {
        print("add it")
        view.endEditing(true)
        guard let text = searchMainView.addIngredientTextField.text else { return }
        ingredientArray = SearchBTNTargets.shared.addIngredient(ingredient: text)
        searchMainView.addIngredientTextField.text = nil 
        searchMainView.ingredientsTabView.reloadData()
    }
    
}
