//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipesVC: UIViewController {
    
    private lazy var favTabView: UITableView = {
       let tabView = UITableView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        return tabView
    }()

    let pokemonArray = ["pikachu", "ratatak", "bulbizarre", "carapuce", "salameche"]

    override func viewDidLoad() {
        super.viewDidLoad()
        favTabView.delegate = self
        favTabView.dataSource = self
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        favTabView.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        view.addSubview(favTabView)
        favTabView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        RecipesContraints.shared.addTabViewConstraints(tabView: favTabView, vc: view)
    }
}

extension RecipesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        cell.textLabel?.text = pokemonArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsVC()
        recipeDetailsVC.labelTest.text = pokemonArray[indexPath.row]
        navigationItem.backButtonTitle = "Back"
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    
    
    
    
}
