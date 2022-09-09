//
//  HotSalesTableViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-06.
//

import UIKit

protocol HotSalesCollectionViewDelegate: AnyObject {
    func didTapCell()
}

class HotSalesTableViewCell: UITableViewCell {
    
    var hotPhones = [HotSalesPhone]()
    weak var delegateView: HotSalesCollectionViewDelegate?
    
    let hotSalesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 380, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "HotSalesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HotSalesCollectionViewCell")
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(hotSalesCollectionView)
        
        hotSalesCollectionView.delegate = self
        hotSalesCollectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        hotSalesCollectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Networking
    func configureHotPhoneCells(with phones: [HotSalesPhone]) {
        self.hotPhones = phones
        DispatchQueue.main.async { [weak self] in
            self?.hotSalesCollectionView.reloadData()
        }
    }
    
    func getHotSalesPhone() {
        APICaller.shared.getHotSalesPhone { [weak self] results in
            switch results {
            case .success(let hotSalesPhones):
                self?.configureHotPhoneCells(with: hotSalesPhones)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - Delegate methods
extension HotSalesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotPhones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCollectionViewCell.identifier, for: indexPath) as? HotSalesCollectionViewCell else { return UICollectionViewCell() }

        cell.configureCell(with: hotPhones, indexPath: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateView?.didTapCell()
    }
}
