//
//  FavoriteCell.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    static let identifier = "recipeCell"
    
    
    lazy var title: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .whiteReciplease)
        text.font = UIFont.chalkboard(fontSize: 25)
        return text
    }()
    
    lazy var ingedients: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .grayReciplease)
        text.font = UIFont.chalkboard(fontSize: 20)
        return text
    }()
    
    lazy var likesLabel: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .whiteReciplease)
        text.font = UIFont.chalkboard(fontSize: 15)
        return text
    }()
    
    lazy var timeLabel: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .whiteReciplease)
        text.font = UIFont.chalkboard(fontSize: 15)
        return text
    }()
    
    lazy var likeIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var timeIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var likeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 5
        stack.addArrangedSubview(likesLabel)
        stack.addArrangedSubview(likeIcon)
        return stack
    }()
    
    lazy var timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 5
        stack.addArrangedSubview(timeLabel)
        stack.addArrangedSubview(timeIcon)
        return stack
    }()
    
    lazy var infoStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillProportionally
        s.alignment = .fill
        s.spacing = 5
        s.addArrangedSubview(likeStack)
        s.addArrangedSubview(timeStack)
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubViews()
    }
    //MARK: Setup the Cell with constraints
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func configureSubViews() {
        backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
    }
    
    func addGradientLayer(imageView: UIImageView) {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.recipleasePantone(color: .chalkBoardBackground)]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.opacity = 0.25
        gradient.locations = [0,1]
        gradient.frame = imageView.bounds
        imageView.layer.insertSublayer(gradient, at: 0)
    }

    
    private func configureSubviews() {
        contentView.addSubview(backgroundImage)
        contentView.sendSubviewToBack(backgroundImage)
    }
        
    
}
