//
//  HomeTableViewHeaderFooterView.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-08.
//

import UIKit

class SelectCategoryHeader: UITableViewHeaderFooterView {
    
    let selectCategoryLabel = makeLabel(withText: "Select Category")
    let viewAllLabel = makeLabel(withText: "view all")
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        selectCategoryLabel.font = UIFont(name: "Mark Pro Bold", size: 25)
        selectCategoryLabel.textColor = UIColor(named: "MyBlackBlue")
        selectCategoryLabel.numberOfLines = 0
        selectCategoryLabel.textAlignment = .left
        
        viewAllLabel.font = UIFont(name: "Mark Pro Medium", size: 15)
        viewAllLabel.textColor = UIColor(named: "MyOrange")
        viewAllLabel.numberOfLines = 0
        
        contentView.addSubview(selectCategoryLabel)
        contentView.addSubview(viewAllLabel)
        
        
        NSLayoutConstraint.activate([
            selectCategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            selectCategoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectCategoryLabel.widthAnchor.constraint(equalToConstant: 210),
            selectCategoryLabel.heightAnchor.constraint(equalToConstant: 32),
            
            viewAllLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            viewAllLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            viewAllLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
