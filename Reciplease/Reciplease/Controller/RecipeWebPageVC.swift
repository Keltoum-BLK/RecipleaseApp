//
//  RecipeWebPageVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 23/12/2021.
//

import UIKit

class RecipeWebPageVC: UIViewController {
    //MARK: property
    let recipeWebPage = RecipeWebView()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipeWebPage
        title = "Reciplease"
    }
}
