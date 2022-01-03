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
        DispatchQueue.main.async {
            self.backgroundImage.addBlackGradientLayerInBackground(frame: self.backgroundImage.bounds, colors: [UIColor.clear, UIColor.recipleasePantone(color: .chalkBoardBackground)])
        }
    }
    
    // MARK: - Subviews
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .whiteReciplease)
        text.font = UIFont.chalkboard(fontSize: 25)
        text.numberOfLines = 2
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var ingredientsLabel: UILabel = {
        let text = UILabel()
        text.textColor = .recipleasePantone(color: .grayReciplease)
        text.text = "tomatoe, salad, cheese, chicken"
        text.font = UIFont.chalkboard(fontSize: 20)
        text.numberOfLines = 2
        text.translatesAutoresizingMaskIntoConstraints = false 
        return text
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RecipeImage")
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
        let subviews = [backgroundImage, infoView, titleLabel, ingredientsLabel]
        for view in subviews {
            contentView.addSubview(view)
        }
    }

}
// MARK: - Constraints
extension RecipeCell {
    private func setInfoViewConstraints() {
        infoStack.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoStack.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        infoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        infoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }

    private func imageConstraints() {
        backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    private func labelsConstraints(){
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true

        ingredientsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 60).isActive = true
        ingredientsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        ingredientsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true

    }

}
