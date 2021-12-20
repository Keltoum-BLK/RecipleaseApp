//
//  SearchingViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class SearchingVC: UIViewController {
    //MARK: Properties
    var ingredientArray = ["potatoes", "tomatoes", "plum", "red wine"]
    
    //MARK: UI Properties
    private let searchMainView = SearchMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchMainView
        searchMainView.ingredientsTabView.delegate = self
        searchMainView.ingredientsTabView.dataSource = self
        searchMainView.ingredientsTabView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
 
}

extension SearchingVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchMainView.ingredientsTabView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
        cell.textLabel?.text = ingredientArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            ingredientArray.remove(at: indexPath.row)
            searchMainView.ingredientsTabView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}
