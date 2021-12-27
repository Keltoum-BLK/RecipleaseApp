//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipesVC: UIViewController {
    

    private let recipesMainView = RecipesMainView()
    let pokemonArray = ["pikachu", "ratatak", "bulbizarre", "carapuce", "salameche"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipesMainView
        recipesMainView.recipesTabView.delegate = self
        recipesMainView.recipesTabView.dataSource = self
        recipesMainView.recipesTabView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier)
        recipesMainView.recipesTabView.rowHeight = 200
        recipesMainView.recipesTabView.estimatedRowHeight = UITableView.automaticDimension
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    }
}

extension RecipesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesMainView.recipesTabView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        cell.title.text = pokemonArray[indexPath.row].uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsVC()
        recipeDetailsVC.recipedetailsView.recipeTitle.text = pokemonArray[indexPath.row].uppercased()
        navigationItem.backButtonTitle = "Back"
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    
    
    
    
}
