//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/01/2022.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
//    //MARK: Orientation property
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .portrait
//    }

    //MARK: Properties
        private let mainView = RecipesMainView()
        private var recipesAddedToFavorite = [RecipeFavorites]()
        lazy var resetBTN:  UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(goToTheTrash))
        btn.tintColor = .recipleasePantone(color: .whiteReciplease)
        return btn
    }()
    //MARK: CoreDataContext Properties
    let coreDataManager = CoreDataManager(managedObjectContext: CoreDataStack.shared.mainContext)
    
        //MARK: Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = mainView
            mainView.recipesTabView.delegate = self
            mainView.recipesTabView.dataSource = self
            navigationItem.rightBarButtonItem = resetBTN
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            loadSavedRecipes()
        }
    //MARK: Methods 
        //Load FavoriteRecipe Array in the app launch
        private func loadSavedRecipes() {
            recipesAddedToFavorite = coreDataManager.fetchFavorites(favoriteRecipe: self.recipesAddedToFavorite)
            mainView.recipesTabView.reloadData()
        }
    //add remove all element in the favoriteRecipes Array
    @objc func goToTheTrash() {
        if !recipesAddedToFavorite.isEmpty {
            coreDataManager.removeAllRecipes(array: recipesAddedToFavorite)
            recipesAddedToFavorite.removeAll()
        mainView.recipesTabView.reloadData()
        } else {
            self.alertEventAppear(title: "Error detected ⛔️", message: "You have already deleted your favorites")
        }
    }
}
//MARK: TABLEVIEW METHODS 
    extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recipesAddedToFavorite.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = mainView.recipesTabView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
            cell.titleLabel.text = recipesAddedToFavorite[indexPath.row].label?.uppercased()
            cell.backgroundImage.downloaded(from: recipesAddedToFavorite[indexPath.row].image ?? "no image")
            cell.timeTitle.text = Tool.shared.getDoubleToString(number: recipesAddedToFavorite[indexPath.row].totalTime)
            cell.likeTitle.text = Tool.shared.getDoubleToString(number: recipesAddedToFavorite[indexPath.row].yield)
            cell.ingredientsLabel.text = recipesAddedToFavorite[indexPath.row].ingredients
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let recipeDetailsVC = RecipeDetailsVC()
            recipeDetailsVC.recipedetailsView.recipeTitle.text = recipesAddedToFavorite[indexPath.row].label?.uppercased()
            recipeDetailsVC.recipedetailsView.recipeImage.downloaded(from: recipesAddedToFavorite[indexPath.row].image ?? "no image")
            recipeDetailsVC.recipedetailsView.likeTitle.text = Tool.shared.getDoubleToString(number: recipesAddedToFavorite[indexPath.row].yield)
            recipeDetailsVC.recipedetailsView.timeTitle.text = Tool.shared.getDoubleToString(number: recipesAddedToFavorite[indexPath.row].totalTime)
            recipeDetailsVC.ingredientsList = recipesAddedToFavorite[indexPath.row].ingredientLines ?? ["no info"]
            recipeDetailsVC.recipeUrl = recipesAddedToFavorite[indexPath.row].url ?? "no url"
            recipeDetailsVC.fillTheStar = recipesAddedToFavorite[indexPath.row].url ?? ""
            navigationItem.backButtonTitle = "Back"
            navigationItem.backBarButtonItem?.tintColor = .white
            navigationController?.pushViewController(recipeDetailsVC, animated: true)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                coreDataManager.removeRecipe(row: indexPath.row, array: recipesAddedToFavorite)
                recipesAddedToFavorite.remove(at: indexPath.row)
                mainView.recipesTabView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}
