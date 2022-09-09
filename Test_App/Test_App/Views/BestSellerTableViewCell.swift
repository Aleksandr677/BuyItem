//
//  BestSellerTableViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-06.
//

import UIKit

class BestSellerTableViewCell: UITableViewCell {
    
    var bestSellerPhones = [BestSellerPhone]()
    weak var delegateView: HotSalesCollectionViewDelegate?
    
    let bestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 185, height: 227)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "BestSellerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSellerCollectionViewCell")
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bestSellerCollectionView)
        
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bestSellerCollectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Networking
    func configureBestSellerCells(with phones: [BestSellerPhone]) {
        self.bestSellerPhones = phones
        DispatchQueue.main.async { [weak self] in
            self?.bestSellerCollectionView.reloadData()
        }
    }
    
    func getBestSellerPhone() {
        APICaller.shared.getBestSellerPhone(complition: { [weak self] results in
            switch results {
            case .success(let bestSellerPhones):
                self?.configureBestSellerCells(with: bestSellerPhones)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

//MARK: - Delegate methods
extension BestSellerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerPhones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.identifier, for: indexPath) as? BestSellerCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(with: bestSellerPhones, indexPath: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateView?.didTapCell()
    }
}
