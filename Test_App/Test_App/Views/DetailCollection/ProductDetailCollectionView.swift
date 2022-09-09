//
//  ProductDetailCollectionView.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-30.
//

import UIKit

class ProductDetailCollectionView: UICollectionView,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var productDetail = DetailModel(CPU: "", camera: "", capacity: [], color: [], id: "", images: [], isFavorites: true, price: 0, rating: 0.0, sd: "", ssd: "", title: "")

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        allowsSelection = true
        
        register(UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        allowsSelection = true
        allowsMultipleSelection = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Networking
    func configureDetailCell(with details: DetailModel) {
        self.productDetail = details
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
        }
    }
    
    func getDetails() {
        APICaller.shared.getProductDetails { [weak self] results in
            switch results {
            case .success(let details):
                self?.configureDetailCell(with: details)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    //MARK: - Delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDetail.images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailCollectionViewCell.identifier, for: indexPath) as? ProductDetailCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell(with: productDetail, indexPath: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height, height: frame.height)
    }
}
