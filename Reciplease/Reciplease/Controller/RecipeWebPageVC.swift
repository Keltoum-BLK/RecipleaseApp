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
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
