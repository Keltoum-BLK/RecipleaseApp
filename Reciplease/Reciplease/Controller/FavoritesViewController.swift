//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/01/2022.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    //MARK: Properties
        private let mainView = RecipesMainView()
        private var favoriteRecipe = [RecipeFavorites]()
        lazy var refreshBTN:  UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(goToTheTrash))
        btn.tintColor = .recipleasePantone(color: .whiteReciplease)
        return btn
    }()
        //MARK: Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = mainView
            mainView.recipesTabView.delegate = self
            mainView.recipesTabView.dataSource = self
            navigationItem.rightBarButtonItem = refreshBTN
           
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            loadSavedRecipes()
            print("FavoriteVC")
        }
    //MARK: Methods 
        //Load FavoriteRecipe Array in the app launch
        private func loadSavedRecipes() {
            let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
            
            do {
                favoriteRecipe = try CoreDataStack.shared.mainContext.fetch(request)
                mainView.recipesTabView.reloadData()
            } catch {
                favoriteRecipe = []
                fatalError()
            }
        }
    //add remove all element in the favoriteRecipes Array
    @objc func goToTheTrash() {
        if !favoriteRecipe.isEmpty {
        CoreDataManager.sharedContext.removeAllRecipes(array: favoriteRecipe)
        favoriteRecipe.removeAll()
        mainView.recipesTabView.reloadData()
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You have already deleted your favorites", vc: self)
        }
    }
}
//MARK: TABLEVIEW METHODS 
    extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteRecipe.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let list = favoriteRecipe[indexPath.row].createIngredientList(ingredients: favoriteRecipe[indexPath.row].ingredients)
            
            let cell = mainView.recipesTabView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
            cell.titleLabel.text = favoriteRecipe[indexPath.row].label?.uppercased()
            cell.backgroundImage.downloaded(from: favoriteRecipe[indexPath.row].image ?? "no image")
            cell.timeTitle.text = Tools.getDoubleToString(number: favoriteRecipe[indexPath.row].totalTime)
            cell.likeTitle.text = Tools.getDoubleToString(number: favoriteRecipe[indexPath.row].yield)
            cell.ingredientsLabel.text = list.joined(separator: ", ")
           
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            let recipeDetailsVC = RecipeDetailsVC(ingredientArray: favoriteRecipe[indexPath.row].ingredientLines ?? ["no info"], url: favoriteRecipe[indexPath.row].url ?? "https://www.youtube.com/watch?v=rUYxOtOUmfw")
            recipeDetailsVC.recipedetailsView.recipeTitle.text = favoriteRecipe[indexPath.row].label?.uppercased()
            recipeDetailsVC.recipedetailsView.recipeImage.downloaded(from: favoriteRecipe[indexPath.row].image ?? "no image")
            recipeDetailsVC.recipedetailsView.likeTitle.text = Tools.getDoubleToString(number: favoriteRecipe[indexPath.row].yield)
            recipeDetailsVC.recipedetailsView.timeTitle.text = Tools.getDoubleToString(number: favoriteRecipe[indexPath.row].totalTime)
            navigationItem.backButtonTitle = "Back"
            navigationItem.backBarButtonItem?.tintColor = .white
            navigationController?.pushViewController(recipeDetailsVC, animated: true)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            print(favoriteRecipe.count)
            if editingStyle == UITableViewCell.EditingStyle.delete {
                CoreDataManager.sharedContext.removeRecipe(indexPath: indexPath, array: favoriteRecipe)
                favoriteRecipe.remove(at: indexPath.row)
                mainView.recipesTabView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}
