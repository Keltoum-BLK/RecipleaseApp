//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class FavoriteVC: UIViewController {
    

    private let recipesMainView = RecipesMainView()
    var recipeSearch = [Recipe]()
    var recipeFavorites = [Recipe]()

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

extension FavoriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeSearch.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesMainView.recipesTabView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
//        cell.titleLabel.text = recipeSearch[indexPath.row].label?.uppercased()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsVC()
//        recipeDetailsVC.recipedetailsView.recipeTitle.text = recipeSearch[indexPath.row].label?.uppercased()
        navigationItem.backButtonTitle = "Back"
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
}
