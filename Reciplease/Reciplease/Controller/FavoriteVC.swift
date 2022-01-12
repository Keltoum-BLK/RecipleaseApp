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
    var recipeFavorites = ["pizza", "garlic bread"]

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
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    init(recipesArray: [Recipe]) {
        recipeSearch = recipesArray
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FavoriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeSearch.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredientsList = recipeSearch[indexPath.row].recipe?.createIngredientList(ingredients: recipeSearch[indexPath.row].recipe?.ingredients)
       
        
        let cell = recipesMainView.recipesTabView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        cell.titleLabel.text = recipeSearch[indexPath.row].recipe?.label?.uppercased()
        cell.backgroundImage.downloaded(from: recipeSearch[indexPath.row].recipe?.image ?? "no image")
        cell.timeTitle.text = Tools.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.totalTime)
        cell.likeTitle.text = Tools.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.yield)
        cell.ingredientsLabel.text = ingredientsList?.joined(separator: ",")
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
