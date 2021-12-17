//
//  IngredientCell.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import UIKit

class IngredientCell: UITableViewCell {

    static let identifier = "ingredientCell"
    
    let pokemonName = UILabel()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    //MARK: Setup the Cell with constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
