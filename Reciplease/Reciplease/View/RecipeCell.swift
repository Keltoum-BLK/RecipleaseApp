//
//  FavoriteCell.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    static let identifier = "recipeCell"
    
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
