//
//  HotSalesHeader.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-08.
//

import UIKit

class HotSalesHeader: UITableViewHeaderFooterView {
    
    let hotSalesLabel = makeLabel(withText: "Hot sales")
    let seeMoreHotButton = UIButton()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        hotSalesLabel.font = UIFont(name: "Mark Pro Bold", size: 25)
        hotSalesLabel.textColor = UIColor(named: "MyBlackBlue")
        hotSalesLabel.textAlignment = .left
        
        seeMoreHotButton.setTitle("see more", for: .normal)
        seeMoreHotButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreHotButton.titleLabel?.font = UIFont(name: "Mark Pro Regular", size: 15)
        seeMoreHotButton.setTitleColor(UIColor(named: "MyOrange"), for: .normal)
        //seeMoreHotButton.addTarget(self, action: #selector(seeMoreButtonPressed), for: .touchUpInside)
        
        contentView.addSubview(hotSalesLabel)
        contentView.addSubview(seeMoreHotButton)
        
        
        NSLayoutConstraint.activate([
            hotSalesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            hotSalesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hotSalesLabel.heightAnchor.constraint(equalToConstant: 32),
            hotSalesLabel.widthAnchor.constraint(equalToConstant: 115),
            
            seeMoreHotButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            seeMoreHotButton.centerYAnchor.constraint(equalTo: hotSalesLabel.centerYAnchor),
            seeMoreHotButton.heightAnchor.constraint(equalToConstant: 19),
            seeMoreHotButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}
