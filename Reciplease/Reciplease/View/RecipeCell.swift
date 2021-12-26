//
//  FavoriteCell.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    static let identifier = "recipeCell"
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setInfoStackConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        addGradientLayer(imageView: backgroundImage)
    }
    
    // MARK: - Subviews
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
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var likeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 5
        stack.addArrangedSubview(likesLabel)
        stack.addArrangedSubview(likeIcon)
        return stack
    }()
    
    private lazy var timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 5
        stack.addArrangedSubview(timeLabel)
        stack.addArrangedSubview(timeIcon)
        return stack
    }()
    
    private lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 5
        stack.addArrangedSubview(likeStack)
        stack.addArrangedSubview(timeStack)
        return stack
    }()
 
    private func addGradientLayer(imageView: UIImageView) {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.recipleasePantone(color: .chalkBoardBackground)]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.opacity = 0.25
        gradient.locations = [0,1]
        gradient.frame = imageView.bounds
        imageView.layer.insertSublayer(gradient, at: 0)
    }
}
// MARK: - Constraints
extension RecipeCell {
    private func setInfoStackConstraints() {
//        contentView.addSubview(infoStack)
//        infoStack.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            infoStack.topAnchor.constraint(equalTo: contentView.topAnchor),
//            infoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            infoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            infoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        ])
    }
}

