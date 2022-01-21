//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit
import CoreData

class RecipeDetailsVC: UIViewController {
    //MARK: Properties
    lazy var star:  UIBarButtonItem = {
        let star = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addFav))
        star.tintColor = .recipleasePantone(color: .goldReciplease)
        return star
    }()
    lazy var recipesFavorites = [RecipeFavorites]()
    var ingredientsList = [String]()
    var favoriteRecipe: RecipeData?
    var recipeUrl = "https://www.marmiton.org/"
    //MainView Properties
    lazy var recipedetailsView = RecipeDetailsMainView()

    //MARK: CoreDataContext Properties
    let context = CoreDataStack.shared.mainContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipedetailsView.ingredientsList.delegate = self
        recipedetailsView.ingredientsList.dataSource = self
        recipedetailsView.delegate = self
        view = recipedetailsView
        title = "Reciplease"
        navigationItem.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = star
    }
    //MARK: Inits
    init (){
        super.init(nibName: nil, bundle: nil)
    }
    
    init(ingredientArray: [String], url: String) {
        ingredientsList = ingredientArray
        recipeUrl = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Methods
    @objc func addFav(){
        print("add it")
        guard let recipe = favoriteRecipe else { return }
        if !CoreDataManager.sharedContext.checkIfRecipeIsAlreadySaved(recipeUrl: recipe.url ?? "no url") {
            star.image = UIImage(systemName: "star.fill")
            CoreDataManager.sharedContext.addRecipe(title: recipe.label ?? "no label",
                                                    totalTime: recipe.totalTime ?? 1.0,
                                                    ingredients: recipe.createIngredientList(ingredients: recipe.ingredients).joined(separator: " , "),
                                                    yield: recipe.yield ?? 1.0,
                                                    image: recipe.image ?? "no image",
                                                    url: recipe.url ?? "no url",
                                                    ingredientsLines: recipe.ingredientLines ?? ["no ingredientLines"])
            
        } else {
            //implement Alert here
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You have already added the recipe", vc: self)
            print("=> OUpps" )
        }
    }
}
extension RecipeDetailsVC: RecipeDetailsDelegate {
    
    //MARK: Methods RecipePageWeb
    func nextView() {
        let recipeWeb = RecipeWebPageVC()
        guard let url = URL(string: recipeUrl) else { return }
        recipeWeb.recipeWebPage.webPage.load(URLRequest(url: url))
        navigationController?.pushViewController(recipeWeb, animated: true)
        print("pushed")
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

