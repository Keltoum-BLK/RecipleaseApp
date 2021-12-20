//
//  IngredientCell.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import UIKit

class IngredientCell: UITableViewCell {

    static let identifier = "ingredientCell"
    
    let ingredient: UILabel = {
        let text = UILabel()
        text.font = UIFont.chalkduster(fontSize: 15)
        text.textColor = UIColor.recipleasePantone(color: .whiteReciplease)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        background()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        background()
        setup()
    }
    
    func setup(){
        ingredient.heightAnchor.constraint(equalToConstant: 60).isActive = true
       
    }
    
    func background(){
        backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
    }
}
