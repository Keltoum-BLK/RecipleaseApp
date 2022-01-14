//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit
import CoreData

class RecipeDetailsVC: UIViewController {
    
    lazy var recipedetailsView = RecipeDetailsMainView()
    lazy var recipesFavorites = [RecipeData]()
    var ingredientsList = [String]()
    var favoriteRecipe: RecipeData?
    let recipeUnwrapped = RecipeData()
    var recipeUrl = "https://www.marmiton.org/"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipedetailsView.ingredientsList.delegate = self
        recipedetailsView.ingredientsList.dataSource = self
        recipedetailsView.delegate = self
        view = recipedetailsView
        title = "Reciplease"
        navigationItem.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addFav))
        navigationItem.rightBarButtonItem?.tintColor = .recipleasePantone(color: .goldReciplease)
        // Do any additional setup after loading the view.
    }
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
    
    @objc func addFav(){
        print("add it")
        saveRecipe(favorite: favoriteRecipe ?? recipeUnwrapped)
        let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
        guard (try? context.fetch(request)) != nil else { return }
        
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
    }
    
    private func saveRecipe(favorite: RecipeData) {
        let recipeFav = RecipeFavorites(context: context)
        if recipeFav.ingredients == favorite.ingredients as NSObject?,
        recipeFav.ingredientLines == favorite.ingredientLines,
        recipeFav.yield == favorite.yield ?? 1.0,
        recipeFav.totalTime == favorite.totalTime ?? 1.0,
        recipeFav.label == favorite.label,
        recipeFav.url == favorite.url,
          recipeFav.image == favorite.image {
            recipesFavorites.append(favorite)
       }
        do {
            try context.save()
        }
        catch {
            print("We were unable to save \(recipeFav)")
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

