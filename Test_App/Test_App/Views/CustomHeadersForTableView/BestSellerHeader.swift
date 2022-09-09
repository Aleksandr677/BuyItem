//
//  BestSellerHeader.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-08.
//

import UIKit

class BestSellerHeader: UITableViewHeaderFooterView {

    let bestSalesLabel = makeLabel(withText: "Best Seller")
    let seeMoreBestButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        bestSalesLabel.font = UIFont(name: "Mark Pro Bold", size: 25)
        bestSalesLabel.textColor = UIColor(named: "MyBlackBlue")
        
        seeMoreBestButton.setTitle("see more", for: .normal)
        seeMoreBestButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreBestButton.titleLabel?.font = UIFont(name: "Mark Pro Regular", size: 15)
        seeMoreBestButton.setTitleColor(UIColor(named: "MyOrange"), for: .normal)
        
        contentView.addSubview(bestSalesLabel)
        contentView.addSubview(seeMoreBestButton)
        
        NSLayoutConstraint.activate([
            bestSalesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            bestSalesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bestSalesLabel.heightAnchor.constraint(equalToConstant: 32),
            bestSalesLabel.widthAnchor.constraint(equalToConstant: 140),
            
            seeMoreBestButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            seeMoreBestButton.centerYAnchor.constraint(equalTo: bestSalesLabel.centerYAnchor),
            seeMoreBestButton.heightAnchor.constraint(equalToConstant: 19),
            seeMoreBestButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}
