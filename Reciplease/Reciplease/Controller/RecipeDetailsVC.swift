//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit
import CoreData

class RecipeDetailsVC: UIViewController {
    //MARK: UI Properties
    lazy var star:  UIBarButtonItem = {
        let star = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addFavorite))
        star.tintColor = .recipleasePantone(color: .goldReciplease)
        return star
    }()
    //MARK: Properties
    var ingredientsList = [String]()
    var recipe: RecipeDetails?
    var recipeUrl = ""
    var fillTheStar = ""
    private let ingredients = ""
    //MainView Properties
    lazy var recipedetailsView = RecipeDetailsMainView()

    //MARK: CoreDataContext Properties
    let coreDataManager = CoreDataManager(managedObjectContext: CoreDataStack.shared.mainContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipedetailsView.ingredientsList.delegate = self
        recipedetailsView.ingredientsList.dataSource = self
        recipedetailsView.delegate = self
        view = recipedetailsView
        title = "Reciplease"
        navigationItem.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = star
        recipeAddStarFill(fillTheStar: fillTheStar)
    }
    
    //MARK: Methods
    @objc func addFavorite(){
        BTNActions.shared.addFavorite(recipe: recipe, star: star, vc: self)
    }
    
    func recipeAddStarFill(fillTheStar: String) {
        if coreDataManager.checkIfRecipeIsAlreadySaved(recipeUrl: fillTheStar) {
            star.image = UIImage(systemName: "star.fill")
        }
    }
}
extension RecipeDetailsVC: RecipeDetailsDelegate {
    
    //MARK: Methods RecipePageWeb
    func nextView() {
        let recipeWeb = RecipeWebPageVC()
        DispatchQueue.main.async {
            guard let url = URL(string: self.recipeUrl) else { return }
            recipeWeb.recipeWebPage.webPage.load(URLRequest(url: url))
            self.navigationController?.pushViewController(recipeWeb, animated: true)
        }
    }
}

extension RecipeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = ingredientsList[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.text = item
        cell.textLabel?.font = UIFont.chalkduster(fontSize: 15)
        cell.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        cell.textLabel?.textColor = UIColor.recipleasePantone(color: .whiteReciplease)
        return cell
    }
}

