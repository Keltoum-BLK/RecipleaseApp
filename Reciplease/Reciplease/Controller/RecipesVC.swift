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
        cell.textLabel?.text = pokemonArray[indexPath.row]
        cell.textLabel?.font = UIFont.chalkduster(fontSize: 20)
        cell.textLabel?.textColor = .recipleasePantone(color: .whiteReciplease)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsVC()
        recipeDetailsVC.recipedetailsView.labelTest.text = pokemonArray[indexPath.row]
        navigationItem.backButtonTitle = "Back"
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    
    
    
    
}
