//
//  DetailViewController.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-28.
//

import UIKit
import iOSDropDown

class FilterViewController: UIViewController {
    
    let filterView: UIView = UIView()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic-closeImage"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "MyBlackBlue")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let filterLabel = makeLabel(withText: "Filter options")
    let brandLabel = makeLabel(withText: "Brand")
    let priceLabel = makeLabel(withText: "Price")
    let sizeLabel = makeLabel(withText: "Size")
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Mark Pro Medium", size: 18)
        button.frame = CGRect(x: 0, y: 0, width: 86, height: 37)
        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor(named: "MyOrange")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let brandDropDown = DropDown(frame: CGRect(x: 0, y: 0, width: 337, height: 37))
    let priceDropDown = DropDown(frame: CGRect(x: 0, y: 0, width: 337, height: 37))
    let sizeDropDown = DropDown(frame: CGRect(x: 0, y: 0, width: 337, height: 37))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        applyConstraints()
        view.backgroundColor = .white
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }
    
    //private functions
    private func setUpUI() {
        filterView.backgroundColor = .white
        filterView.layer.cornerRadius = 15
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        filterLabel.font = UIFont(name: "Mark Pro Medium", size: 18)
        filterLabel.textColor = UIColor(named: "MyBlackBlue")
        brandLabel.font = UIFont(name: "Mark Pro Medium", size: 18)
        brandLabel.textColor = UIColor(named: "MyBlackBlue")
        priceLabel.font = UIFont(name: "Mark Pro Medium", size: 18)
        priceLabel.textColor = UIColor(named: "MyBlackBlue")
        sizeLabel.font = UIFont(name: "Mark Pro Medium", size: 18)
        sizeLabel.textColor = UIColor(named: "MyBlackBlue")
        
        brandDropDown.placeholder = "Choose your brand"
        brandDropDown.translatesAutoresizingMaskIntoConstraints = false
        brandDropDown.optionArray = ["Samsung", "Apple", "Xiaomi", "OnePlus", "Nokia"]
        brandDropDown.textColor = UIColor(named: "MyBlackBlue")
        brandDropDown.font = UIFont(name: "Mark Pro Regular", size: 18)
        brandDropDown.selectedRowColor = UIColor(named: "MyOrange")!
        brandDropDown.arrowSize = 20
        brandDropDown.textAlignment = .center
        
        priceDropDown.placeholder = "Choose your price"
        priceDropDown.translatesAutoresizingMaskIntoConstraints = false
        priceDropDown.optionArray = ["$0 - $500", "$500 - $1000", "$1000 - $1500", "$1500 - $2000", "$2000 - $5000", "$5000 - $7500", "$7500 - $10000" ]
        priceDropDown.textColor = UIColor(named: "MyBlackBlue")
        priceDropDown.font = UIFont(name: "Mark Pro Regular", size: 18)
        priceDropDown.selectedRowColor = UIColor(named: "MyOrange")!
        priceDropDown.arrowSize = 20
        priceDropDown.textAlignment = .center
        
        sizeDropDown.placeholder = "Choose your size"
        sizeDropDown.translatesAutoresizingMaskIntoConstraints = false
        sizeDropDown.optionArray = ["3.5 to 4.0 inches", "4.0 - 4.5 inches", "4.5 - 5.0 inches", "5.0 - 5.5 inches", "5.5 - 6.0 inches", "6.0 - 6.5 inches", "6.5 - 7.0 inches"]
        sizeDropDown.textColor = UIColor(named: "MyBlackBlue")
        sizeDropDown.font = UIFont(name: "Mark Pro Regular", size: 18)
        sizeDropDown.selectedRowColor = UIColor(named: "MyOrange")!
        sizeDropDown.arrowSize = 20
        sizeDropDown.textAlignment = .center
        
        filterView.addSubview(closeButton)
        filterView.addSubview(filterLabel)
        filterView.addSubview(brandLabel)
        filterView.addSubview(priceLabel)
        filterView.addSubview(sizeLabel)
        filterView.addSubview(doneButton)
        filterView.addSubview(brandDropDown)
        filterView.addSubview(priceDropDown)
        filterView.addSubview(sizeDropDown)
        view.addSubview(filterView)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterView.topAnchor.constraint(equalTo: view.topAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 350),
            
            closeButton.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 46),
            closeButton.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 37),
            closeButton.heightAnchor.constraint(equalToConstant: 37),
            
            filterLabel.centerXAnchor.constraint(equalTo: filterView.centerXAnchor),
            filterLabel.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 31),
            
            doneButton.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -20),
            doneButton.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 86),
            doneButton.heightAnchor.constraint(equalToConstant: 37),
            
            brandLabel.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor),
            brandLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 35),
            
            brandDropDown.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 46),
            brandDropDown.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -31),
            brandDropDown.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 10),
            brandDropDown.heightAnchor.constraint(equalToConstant: 31),
            
            priceLabel.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: brandDropDown.bottomAnchor, constant: 20),
            
            priceDropDown.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 46),
            priceDropDown.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -31),
            priceDropDown.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            priceDropDown.heightAnchor.constraint(equalToConstant: 31),
            
            sizeLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            sizeLabel.topAnchor.constraint(equalTo: priceDropDown.bottomAnchor, constant: 20),
            
            sizeDropDown.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 46),
            sizeDropDown.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -31),
            sizeDropDown.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            sizeDropDown.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
    @objc func closeButtonPressed() {
        self.dismiss(animated: true)
    }
    
    @objc func doneButtonPressed() {
        self.dismiss(animated: true)
        //do additional work
    }
}
