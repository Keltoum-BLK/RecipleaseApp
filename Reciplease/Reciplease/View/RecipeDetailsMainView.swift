//
//  RecipeDetailsMainView.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 22/12/2021.
//

import Foundation
import UIKit

class RecipeDetailsMainView: UIView {
    
   lazy var labelTest: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "chalkduster", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }

    private func configureSubviews() {
        addSubview(labelTest)
        backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
    }
    
    func setUpContraints() {
        labelTest.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelTest.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelTest.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
 
    
   
    
}

