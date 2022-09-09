//
//  SelectItemTableViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-06.
//

import UIKit

class SelectItemTableViewCell: UITableViewCell {
    
    var cells = [SelectCategoryModel]()
    let selectCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 23
        layout.itemSize = CGSize(width: 71, height: 93)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: SelectCategoryCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(selectCategoryCollectionView)
        selectCategoryCollectionView.delegate = self
        selectCategoryCollectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectCategoryCollectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fetchCells(cells: [SelectCategoryModel]) {
        self.cells = cells
    }
}

//MARK: - Delegate methods
extension SelectItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCategoryCollectionViewCell.identifier, for: indexPath) as? SelectCategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.circleView.image = cells[indexPath.row].itemImage
        cell.itemImage = cells[indexPath.row].itemImage
        cell.itemName.text = cells[indexPath.row].itemName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell {
            cell.circleView.backgroundColor = UIColor(named: "MyOrange")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell {
            cell.circleView.backgroundColor = .white
        }
    }
}
