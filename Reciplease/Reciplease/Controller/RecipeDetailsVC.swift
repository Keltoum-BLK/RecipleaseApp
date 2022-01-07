//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit

class RecipeDetailsVC: UIViewController {

   lazy var recipedetailsView = RecipeDetailsMainView()
    lazy var recipesFavorites = [Recipe]()
    var ingredientsList = ["2 cas de poudre de fée", "3 ml de rhum", "1 crochet de pirate"]
    var favoriteRecipe: Recipe?
    
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

    
    @objc func addFav(){
        print("add it")
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
    }

}
    
extension RecipeDetailsVC: RecipeDetailsDelegate {
   
    //MARK: Methods RecipePageWeb
    func nextView() {
        let recipeWeb = RecipeWebPageVC()
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

