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
        configureSubViews()
        layoutSubviews()
        setInfoViewConstraints()
        imageConstraints()
        labelsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.addBlackGradientLayerInBackground(frame: backgroundImage.frame, colors: [UIColor.clear, UIColor.recipleasePantone(color: .chalkBoardBackground)])
    }
    
    // MARK: - Subviews
    lazy var title: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .whiteReciplease)
        text.font = UIFont.chalkboard(fontSize: 25)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var ingredients: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .grayReciplease)
        text.text = "tomatoe, salad, cheese, chicken"
        text.font = UIFont.chalkboard(fontSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false 
        return text
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RecipeCellImage")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "hand.thumbsup.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = .recipleasePantone(color: .whiteReciplease)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var timeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.contentMode = .scaleAspectFill
        image.tintColor = .recipleasePantone(color: .whiteReciplease)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var likeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "NA"
        label.textAlignment = .center
        label.font = UIFont.chalkboard(fontSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var timeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "NAm"
        label.textAlignment = .center
        label.font = UIFont.chalkboard(fontSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.addArrangedSubview(likeTitle)
        stack.addArrangedSubview(likeImage)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.addArrangedSubview(timeTitle)
        stack.addArrangedSubview(timeImage)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        stack.addArrangedSubview(likeStack)
        stack.addArrangedSubview(timeStack)
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var infoView: UIView = {
       let container = UIView()
        container.addSubview(infoStack)
        container.layer.cornerRadius = 10
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.recipleasePantone(color: .grayReciplease).cgColor
        container.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    
    private func configureSubViews() {
        let subviews = [backgroundImage, infoView, title, ingredients]
        for view in subviews {
            addSubview(view)
        }
    }

}
// MARK: - Constraints
extension RecipeCell {
    private func setInfoViewConstraints() {
        infoStack.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoStack.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        infoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        infoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    private func imageConstraints() {
        backgroundImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    private func labelsConstraints(){
        title.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 40).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        
        ingredients.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 70).isActive = true
        ingredients.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        ingredients.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        
    }
    
}

