//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit

class RecipeDetailsVC: UIViewController {

   lazy var recipedetailsView = RecipeDetailsMainView()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
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

    

