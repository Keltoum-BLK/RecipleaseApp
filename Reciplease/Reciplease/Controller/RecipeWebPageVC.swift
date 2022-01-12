//
//  RecipeWebPageVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 23/12/2021.
//

import UIKit

class RecipeWebPageVC: UIViewController {
    
    let recipeWebPage = RecipeWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipeWebPage
        title = "Reciplease"
    }
}
