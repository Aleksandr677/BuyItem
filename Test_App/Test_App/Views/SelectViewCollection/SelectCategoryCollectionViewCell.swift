//
//  SelectCategoryCollectionViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-22.
//

import UIKit

class SelectCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "SelectCategoryCollectionViewCell"
    
    var circleView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(red: 0.7, green: 0.7, blue: 0.76, alpha: 1.0)
        imageView.backgroundColor = .white
        return imageView
    }()
    
    var itemImage: UIImage = {
        let image = UIImage()
        image.withTintColor(.label)
        return image
    }()
    
    var itemName: UILabel = {
        let name = UILabel()
        name.textColor = UIColor(named: "MyBlackBlue")
        name.font = UIFont(name: "Mark Pro Medium", size: 12)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circleView.image = itemImage
        addSubview(circleView)
        addSubview(itemName)
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 71),
            
            itemName.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 7),
            itemName.centerXAnchor.constraint(equalTo: centerXAnchor),
            itemName.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
