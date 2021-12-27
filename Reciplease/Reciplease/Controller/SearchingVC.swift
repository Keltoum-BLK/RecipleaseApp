//
//  SearchingViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class SearchingVC: UIViewController {
    //MARK: Properties
    private var ingredientArray = ["potatoes", "tomatoes", "plum", "red wine"]
    
    //MARK: UI Properties
    private let searchMainView = SearchMainView()
    
    let ingredientCellIdentifier = "ingredientCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchMainView
        searchMainView.delegate = self
        searchMainView.ingredientsTabView.delegate = self
        searchMainView.ingredientsTabView.dataSource = self
        searchMainView.ingredientsTabView.register(UITableViewCell.self, forCellReuseIdentifier: ingredientCellIdentifier)
        self.edgesForExtendedLayout = UIRectEdge()
        self.extendedLayoutIncludesOpaqueBars = false
       
       
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
        let cell = searchMainView.ingredientsTabView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) 
        cell.textLabel?.text = ingredientArray[indexPath.row]
        cell.textLabel?.font = UIFont.chalkduster(fontSize: 20)
        cell.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        cell.textLabel?.textColor = UIColor.recipleasePantone(color: .whiteReciplease)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            ingredientArray.remove(at: indexPath.row)
            searchMainView.ingredientsTabView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
}

extension SearchingVC: SearchMainViewDelegate {
    //Methods SearchMainViewDelegate
    func clearIngredientList() {
        print("cleared")
    }
    
    func searchRecipes() {
        print("search")
    }
    
    func addIngredient() {
        
        print("add ingredient")
    }
    
}
