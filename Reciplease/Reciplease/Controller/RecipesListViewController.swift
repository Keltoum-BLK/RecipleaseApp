//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    //MARK: Properties
    private let recipesMainView = RecipesMainView()
    private var recipeSearch = [Recipe]()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipesMainView
        recipesMainView.recipesTabView.delegate = self
        recipesMainView.recipesTabView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    }
    //MARK: Inits
    init(){
        super.init(nibName: nil, bundle: nil)
    }

    init(recipesArray: [Recipe]) {
        super.init(nibName: nil, bundle: nil)
        recipeSearch = recipesArray
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView methods
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
        cell.timeTitle.text = Tool.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.totalTime)
        cell.likeTitle.text = Tool.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.yield)
        cell.ingredientsLabel.text = ingredientsList?.joined(separator: ", ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsVC()
        recipeDetailsVC.recipedetailsView.recipeTitle.text = recipeSearch[indexPath.row].recipe?.label?.uppercased()
        recipeDetailsVC.recipedetailsView.recipeImage.downloaded(from: recipeSearch[indexPath.row].recipe?.image ?? "no image")
        recipeDetailsVC.recipedetailsView.likeTitle.text = Tool.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.yield)
        recipeDetailsVC.recipedetailsView.timeTitle.text = Tool.getDoubleToString(number: recipeSearch[indexPath.row].recipe?.totalTime)
        recipeDetailsVC.ingredientsList = recipeSearch[indexPath.row].recipe?.ingredientLines ?? ["no info"]
        recipeDetailsVC.recipeUrl = recipeSearch[indexPath.row].recipe?.url ?? "no url"
        recipeDetailsVC.recipe = recipeSearch[indexPath.row].recipe
        recipeDetailsVC.fillTheStar = recipeSearch[indexPath.row].recipe?.url ?? "" 
        navigationItem.backButtonTitle = "Back"
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
}
