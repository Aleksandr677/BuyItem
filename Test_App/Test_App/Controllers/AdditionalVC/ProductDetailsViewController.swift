//
//  ProductDetailsViewController.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-30.
//

import UIKit
import Cosmos

class ProductDetailsViewController: UIViewController {
    
    //
    let productDetailsCollectionView = ProductDetailCollectionView()
    let phoneLabel = makeLabel(withText: "")
    let rating = CosmosView()
    let detailView = makeView()
    let favoriteButtonDetails = makeButton(withImage: "ic-favotite")

    let chipImage = makeImageView(with: "ic-chip")
    let chipLabel = makeLabel(withText: "")
    
    let cameraImage = makeImageView(with: "ic-camera")
    let cameraLabel = makeLabel(withText: "")
    
    let RAMImage = makeImageView(with: "ic-RAM")
    let RAMLabel = makeLabel(withText: "")
    
    let memoryImage = makeImageView(with: "ic-memory")
    let memoryLabel = makeLabel(withText: "")
    
    let colorLabel = makeLabel(withText: "Select color and capacity")
    
    var firstTitle = "Shop"
    var secondTitle = "Details"
    var thirdTitle = "Features"
    var segmentedControl = CustomSegmentedControl()
    
    var firstTitleMemory = makeLabel(withText: "")
    var secondTitleMemmory = makeLabel(withText: "")
    var segmentedControlMemory = CustomSelectedControlMemory()
    
    var firstColor = hexStringToUIColor(hex: "")
    var secondColor = hexStringToUIColor(hex: "")
    var segmentedControlColor = CustomSegmentedControlColor()
    
    let addToCartLabel = makeLabel(withText: "Add to Cart")
    let addToCartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        setUpNavBar()
        setUpUI()
        productDetailsCollectionView.getDetails()
        getInfoDetail()
    }
    
    private func setUpNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-chevronDetails"), style: .plain, target: self, action: #selector(leftBarButtonPressed))
        navigationItem.leftBarButtonItem?.customView?.layer.cornerRadius = 4
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.customView?.backgroundColor = UIColor(named: "MyBlackBlue")
        navigationItem.leftBarButtonItem?.setBackgroundImage(UIImage(named: "ic-chevronColor"), for: .normal, barMetrics: .default)
        
        navigationItem.title = "Product Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-bagDetails"), style: .plain, target: self, action: #selector(rightBarButtonPressed))
        navigationItem.rightBarButtonItem?.customView?.layer.cornerRadius = 4
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.customView?.backgroundColor = UIColor(named: "MyOrange")
        navigationItem.rightBarButtonItem?.setBackgroundImage(UIImage(named: "ic-bagColor"), for: .normal, barMetrics: .default)
    }
    
    //functions
    @objc func leftBarButtonPressed() {
        //do additional work
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarButtonPressed() {
        //do additional work
    }
    
    @objc func favoriteButtonDetailsPressed() {
        if favoriteButtonDetails.tag == 0 {
            favoriteButtonDetails.setImage(UIImage(named: "ic-favotite"), for: .normal)
            favoriteButtonDetails.tag = 1
        } else {
            favoriteButtonDetails.setImage(UIImage(named: "ic-likeFilled"), for: .normal)
            favoriteButtonDetails.tag = 0
        }
    }
    
    private func setUpUI() {
        
        phoneLabel.font = UIFont(name: "Mark Pro Medium", size: 24)
        phoneLabel.textColor = UIColor(named: "MyBlackBlue")
        phoneLabel.textAlignment = .left
        
        favoriteButtonDetails.backgroundColor = UIColor(named: "MyBlackBlue")
        favoriteButtonDetails.layer.cornerRadius = 12
        favoriteButtonDetails.addTarget(self, action: #selector(favoriteButtonDetailsPressed), for: .touchUpInside)
        
        rating.settings.fillMode = .half
        rating.rating = 0
        rating.settings.filledImage = UIImage(named: "ic-star")
        rating.settings.starSize = 20
        rating.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl = CustomSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 35), buttonTitle: [firstTitle, secondTitle, thirdTitle])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        detailView.backgroundColor = .white
        detailView.layer.cornerRadius = 30
        
        chipLabel.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1)
        chipLabel.font = UIFont(name: "Mark Pro Regular", size: 11)
        chipLabel.adjustsFontSizeToFitWidth = true
        
        cameraLabel.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1)
        cameraLabel.font = UIFont(name: "Mark Pro Regular", size: 11)
        cameraLabel.adjustsFontSizeToFitWidth = true
        
        RAMLabel.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1)
        RAMLabel.font = UIFont(name: "Mark Pro Regular", size: 11)
        RAMLabel.adjustsFontSizeToFitWidth = true
        
        memoryLabel.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1)
        memoryLabel.font = UIFont(name: "Mark Pro Regular", size: 11)
        memoryLabel.adjustsFontSizeToFitWidth = true
        
        colorLabel.textColor = UIColor(named: "MyBlackBlue")
        colorLabel.font = UIFont(name: "Mark Pro Medium", size: 16)
        colorLabel.textAlignment = .left
        
        segmentedControlMemory = CustomSelectedControlMemory(frame: CGRect(x: 0, y: 0, width: 165, height: 31), buttonTitle: [firstTitleMemory, secondTitleMemmory])
        segmentedControlMemory.translatesAutoresizingMaskIntoConstraints = false
        firstTitleMemory.font = UIFont(name: "Mark Pro Bold", size: 13)
        secondTitleMemmory.font = UIFont(name: "Mark Pro Bold", size: 13)
        
        segmentedControlColor = CustomSegmentedControlColor(frame: CGRect(x: 0, y: 0, width: 90, height: 40), buttonColor: [firstColor, secondColor])
        segmentedControlColor.translatesAutoresizingMaskIntoConstraints = false
        
        addToCartLabel.font = UIFont(name: "Mark Pro Bold", size: 20)
        addToCartLabel.textColor = .white
        
        addToCartButton.setTitle(addToCartLabel.text, for: .normal)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.backgroundColor = UIColor(named: "MyOrange")
        addToCartButton.layer.cornerRadius = 10
        
        //add to view
        detailView.addSubview(phoneLabel)
        detailView.addSubview(favoriteButtonDetails)
        detailView.addSubview(rating)
        detailView.addSubview(segmentedControl)
        detailView.addSubview(chipImage)
        detailView.addSubview(cameraImage)
        detailView.addSubview(RAMImage)
        detailView.addSubview(memoryImage)
        detailView.addSubview(chipLabel)
        detailView.addSubview(cameraLabel)
        detailView.addSubview(RAMLabel)
        detailView.addSubview(memoryLabel)
        detailView.addSubview(colorLabel)
        detailView.addSubview(segmentedControlMemory)
        detailView.addSubview(segmentedControlColor)
        detailView.addSubview(addToCartButton)
        view.addSubview(detailView)
        view.addSubview(productDetailsCollectionView)
        
        //constraints
        NSLayoutConstraint.activate([
            productDetailsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            productDetailsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            productDetailsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            productDetailsCollectionView.bottomAnchor.constraint(equalTo: detailView.topAnchor, constant: -10),
            
            phoneLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 38),
            phoneLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 15),
            phoneLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: 10),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30),
            
            favoriteButtonDetails.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 28),
            favoriteButtonDetails.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -37),
            favoriteButtonDetails.heightAnchor.constraint(equalToConstant: 34),
            favoriteButtonDetails.widthAnchor.constraint(equalToConstant: 33),
            
            rating.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 7),
            rating.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            rating.heightAnchor.constraint(equalToConstant: 18),
            
            segmentedControl.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 30),
            segmentedControl.widthAnchor.constraint(equalTo: detailView.widthAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 25),
            
            chipImage.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 40),
            chipImage.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 55),
            chipImage.widthAnchor.constraint(equalToConstant: 28),
            chipImage.heightAnchor.constraint(equalToConstant: 28),
            
            cameraImage.centerYAnchor.constraint(equalTo: chipImage.centerYAnchor),
            cameraImage.leadingAnchor.constraint(equalTo: chipImage.trailingAnchor, constant: 64),
            cameraImage.widthAnchor.constraint(equalToConstant: 28),
            cameraImage.heightAnchor.constraint(equalToConstant: 28),
            
            RAMImage.centerYAnchor.constraint(equalTo: chipImage.centerYAnchor),
            RAMImage.leadingAnchor.constraint(equalTo: cameraImage.trailingAnchor, constant: 64),
            RAMImage.widthAnchor.constraint(equalToConstant: 28),
            RAMImage.heightAnchor.constraint(equalToConstant: 28),
            
            memoryImage.centerYAnchor.constraint(equalTo: chipImage.centerYAnchor),
            memoryImage.leadingAnchor.constraint(equalTo: RAMImage.trailingAnchor, constant: 54),
            memoryImage.widthAnchor.constraint(equalToConstant: 28),
            memoryImage.heightAnchor.constraint(equalToConstant: 28),
            
            chipLabel.centerXAnchor.constraint(equalTo: chipImage.centerXAnchor),
            chipLabel.topAnchor.constraint(equalTo: chipImage.bottomAnchor, constant: 5),
            chipLabel.widthAnchor.constraint(equalToConstant: 64),
            chipLabel.heightAnchor.constraint(equalToConstant: 14),
            
            cameraLabel.centerXAnchor.constraint(equalTo: cameraImage.centerXAnchor),
            cameraLabel.centerYAnchor.constraint(equalTo: chipLabel.centerYAnchor),
            cameraLabel.widthAnchor.constraint(equalToConstant: 64),
            cameraLabel.heightAnchor.constraint(equalToConstant: 14),
            
            RAMLabel.centerXAnchor.constraint(equalTo: RAMImage.centerXAnchor),
            RAMLabel.centerYAnchor.constraint(equalTo: chipLabel.centerYAnchor),
            RAMLabel.widthAnchor.constraint(equalToConstant: 64),
            RAMLabel.heightAnchor.constraint(equalToConstant: 14),
            
            memoryLabel.centerXAnchor.constraint(equalTo: memoryImage.centerXAnchor),
            memoryLabel.centerYAnchor.constraint(equalTo: chipLabel.centerYAnchor),
            memoryLabel.widthAnchor.constraint(equalToConstant: 64),
            memoryLabel.heightAnchor.constraint(equalToConstant: 14),
            
            colorLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30),
            colorLabel.topAnchor.constraint(equalTo: chipLabel.bottomAnchor, constant: 29),
            colorLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            colorLabel.heightAnchor.constraint(equalToConstant: 22),
            
            segmentedControlMemory.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 18),
            segmentedControlMemory.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -63),
            segmentedControlMemory.heightAnchor.constraint(equalToConstant: 31),
            segmentedControlMemory.widthAnchor.constraint(equalToConstant: 150),
            
            segmentedControlColor.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 15),
            segmentedControlColor.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            segmentedControlColor.widthAnchor.constraint(equalToConstant: 90),
            segmentedControlColor.heightAnchor.constraint(equalToConstant: 40),
            
            addToCartButton.topAnchor.constraint(equalTo: segmentedControlColor.bottomAnchor, constant: 20),
            addToCartButton.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 29),
            addToCartButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -29),
            addToCartButton.heightAnchor.constraint(equalToConstant: 54),
            addToCartButton.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -15),
            
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Networking
extension ProductDetailsViewController {
    //Networking
    func getInfoDetail() {
        APICaller.shared.getProductDetails { [weak self] results in
            switch results {
            case .success(let details):
                
                DispatchQueue.main.async { [self] in
                    self?.rating.rating = details.rating
                    self?.phoneLabel.text = details.title
                    
                    if details.isFavorites {
                        self?.favoriteButtonDetails.setImage(UIImage(named: "ic-likeFilled"), for: .normal)
                    } else {
                        self?.favoriteButtonDetails.setImage(UIImage(named: "ic-favotite"), for: .normal)
                    }
                    
                    self?.chipLabel.text = details.CPU
                    self?.cameraLabel.text = details.camera
                    self?.RAMLabel.text = details.ssd
                    self?.memoryLabel.text = details.sd
                    self?.firstTitleMemory.text = String("\(details.capacity[0]) GB")
                    self?.secondTitleMemmory.text = String("\(details.capacity[1]) GB")
                    self?.addToCartLabel.text = String("Add to Cart   $\(details.price).00")
                    self?.addToCartButton.setTitle(self?.addToCartLabel.text, for: .normal)
                    
                    let firstC = hexStringToUIColor(hex: details.color[0])
                    let secondC = hexStringToUIColor(hex: details.color[1])
                    self?.segmentedControlColor.setButtonTitles(buttonColors: [firstC,secondC])
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

