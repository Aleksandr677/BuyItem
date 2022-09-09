//
//  PurchaseViewController.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-21.
//

import UIKit
import SwiftyStepper

class PurchaseViewController: UIViewController {
    
    private let myCartLabel = makeLabel(withText: "My Cart")
    private let cartView = UIView()
    private let firstDividerImage = makeImageView(with: "ic-divider")
    private let secondDividerImage = makeImageView(with: "ic-divider")
    private let totalLabel = makeLabel(withText: "Total")
    private let deliveryLabel = makeLabel(withText: "Delivery")
    private let priceLabel = makeLabel(withText: "$0.00 us")
    private let priceDeliveryLabel = makeLabel(withText: "Free")
    private let cartTableView = UITableView()
    private let buttonCheckout = UIButton()
    
    
    
    var cartCell = MyCartTableViewCell()
    
    var cartInfo = MyCartModel(basket: [], delivery: "", id: "", total: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCartInfo()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        setUpNavBarMyCart()
        setUpMyCartUI()
        cartTableView.register(UINib(nibName: "MyCartTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCartTableViewCell")
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    private func setUpNavBarMyCart() {
        
        //set up left button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-chevronDetails"), style: .plain, target: self, action: #selector(leftBarButtonMyCartPressed))
        navigationItem.leftBarButtonItem?.customView?.layer.cornerRadius = 4
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.customView?.backgroundColor = UIColor(named: "MyBlackBlue")
        navigationItem.leftBarButtonItem?.setBackgroundImage(UIImage(named: "ic-chevronColor"), for: .normal, barMetrics: .default)
        
        //set up right button
        let button = UIButton.init(type: .custom)
        button.addTarget(self, action: #selector(rightBarButtonMyCartPressed), for: .touchUpInside)
        let imageView = UIImageView(frame: CGRect(x: 104, y: 0, width: 37, height: 37))
        imageView.image = UIImage(named: "ic-pointerMyCart")
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor(named: "MyOrange")
        
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: 95, height: 19))
        label.text = "Add address"
        label.font = UIFont(name: "Mark Pro Medium", size: 15)
        label.textColor = UIColor(named: "MyBlackBlue")
        
        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 141, height: 37))
        button.frame = buttonView.frame
        
        view.addSubview(imageView)
        buttonView.addSubview(button)
        buttonView.addSubview(label)
        buttonView.addSubview(imageView)
        
        let barButton = UIBarButtonItem.init(customView: buttonView)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func leftBarButtonMyCartPressed() {
        tabBarController?.selectedIndex = 0
    }
    
    @objc func rightBarButtonMyCartPressed() {
        //do additional work
    }
    
    func setUpMyCartUI() {
        myCartLabel.font = UIFont(name: "Mark Pro Bold", size: 35)
        myCartLabel.textColor = UIColor(named: "MyBlackBlue")
        
        cartView.backgroundColor = UIColor(named: "MyBlackBlue")
        cartView.layer.cornerRadius = 15
        cartView.translatesAutoresizingMaskIntoConstraints = false
        
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.backgroundColor = UIColor(named: "MyBlackBlue")
        
        firstDividerImage.contentMode = .scaleToFill
        
        totalLabel.font = UIFont(name: "Mark Pro Regular", size: 15)
        totalLabel.textColor = UIColor.white
        
        deliveryLabel.font = UIFont(name: "Mark Pro Regular", size: 15)
        deliveryLabel.textColor = UIColor.white
        
        priceLabel.font = UIFont(name: "Mark Pro Bold", size: 15)
        priceLabel.textColor = UIColor.white
        priceLabel.textAlignment = .left
        
        priceDeliveryLabel.font = UIFont(name: "Mark Pro Bold", size: 15)
        priceDeliveryLabel.textColor = UIColor.white
        priceDeliveryLabel.textAlignment = .left
        
        secondDividerImage.contentMode = .scaleToFill
        
        buttonCheckout.setTitle("Checkout", for: .normal)
        buttonCheckout.translatesAutoresizingMaskIntoConstraints = false
        buttonCheckout.backgroundColor = UIColor(named: "MyOrange")
        buttonCheckout.layer.cornerRadius = 10
        
        cartView.addSubview(firstDividerImage)
        cartView.addSubview(totalLabel)
        cartView.addSubview(deliveryLabel)
        cartView.addSubview(priceLabel)
        cartView.addSubview(priceDeliveryLabel)
        cartView.addSubview(secondDividerImage)
        cartView.addSubview(cartTableView)
        cartView.addSubview(buttonCheckout)
        view.addSubview(myCartLabel)
        view.addSubview(cartView)
        
        NSLayoutConstraint.activate([
            myCartLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            myCartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            
            cartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cartView.topAnchor.constraint(equalTo: myCartLabel.bottomAnchor, constant: 49),
            cartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            cartTableView.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 40),
            cartTableView.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 33),
            cartTableView.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -33),
            cartTableView.bottomAnchor.constraint(equalTo: firstDividerImage.topAnchor, constant: -25),
            
            firstDividerImage.topAnchor.constraint(equalTo: cartTableView.bottomAnchor, constant: 170),
            firstDividerImage.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 4),
            firstDividerImage.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -4),
            firstDividerImage.heightAnchor.constraint(equalToConstant: 1),
            
            totalLabel.topAnchor.constraint(equalTo: firstDividerImage.bottomAnchor, constant: 15),
            totalLabel.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 55),
            totalLabel.widthAnchor.constraint(equalToConstant: 40),
            
            deliveryLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 12),
            deliveryLabel.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 55),
            deliveryLabel.widthAnchor.constraint(equalToConstant: 65),
            
            priceLabel.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: 80),
            priceLabel.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -35),
            
            priceDeliveryLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            priceDeliveryLabel.centerYAnchor.constraint(equalTo: deliveryLabel.centerYAnchor),
            priceDeliveryLabel.widthAnchor.constraint(equalToConstant: 35),
            
            secondDividerImage.topAnchor.constraint(equalTo: priceDeliveryLabel.bottomAnchor, constant: 26),
            secondDividerImage.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 4),
            secondDividerImage.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -4),
            secondDividerImage.heightAnchor.constraint(equalToConstant: 1),
            
            buttonCheckout.topAnchor.constraint(equalTo: secondDividerImage.bottomAnchor, constant: 27),
            buttonCheckout.leadingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: 44),
            buttonCheckout.trailingAnchor.constraint(equalTo: cartView.trailingAnchor, constant: -44),
            buttonCheckout.bottomAnchor.constraint(equalTo: cartView.bottomAnchor, constant: -44)
        
        ])
    }
}

//MARK: - TableView delegate methods

extension PurchaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartInfo.basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartTableViewCell", for: indexPath) as? MyCartTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "MyBlackBlue")
        cell.configureCell(with: cartInfo, at: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - Configure view
extension PurchaseViewController {
    
    func updateModel(with model: MyCartModel) {
        self.cartInfo = model
    }
    
    func fetchCartInfo() {
        APICaller.shared.getMyCartInfo { [weak self] results in
            switch results {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.updateModel(with: model)
                    self?.priceDeliveryLabel.text = model.delivery
                    self?.priceLabel.text = String("$\(model.total) us")
                    self?.cartTableView.reloadData()
                    guard model.basket.count != 0 else { return }
                    self?.navigationController?.tabBarItem.badgeValue = String(model.basket.count)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - MyCart delegate method
extension PurchaseViewController: MyCartTableViewCellDelegate {
    
    func didTapStepper() {
        cartCell.stepperPlusButtonPressed(UIButton())
        cartCell.stepperMinusButtonPressed(UIButton())
    }
}
