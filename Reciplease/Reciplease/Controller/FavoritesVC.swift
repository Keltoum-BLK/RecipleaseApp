//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class FavoritesVC: UIViewController {
    
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
        view.addSubview(favTabView)
        favTabView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        FavoritesLayout.shared.addTabViewConstraints(tabView: favTabView, vc: view)
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        FavoritesLayout.shared.addTabViewConstraints(tabView: favTabView, vc: view)
    }

   
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        cell.textLabel?.text = pokemonArray[indexPath.row]
        return cell
    }
    
    
    
    
    
}
