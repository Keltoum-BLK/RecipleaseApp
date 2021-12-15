//
//  RecipeDetailsVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 15/12/2021.
//

import UIKit

class RecipeDetailsVC: UIViewController {

    let labelTest: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.textColor = .white
        label.font = UIFont(name: "chalkduster", size: 15)
        return label
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelTest)
       
        title = "Reciplease"
        labelTest.translatesAutoresizingMaskIntoConstraints = false
        labelTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTest.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelTest.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true 
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
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
