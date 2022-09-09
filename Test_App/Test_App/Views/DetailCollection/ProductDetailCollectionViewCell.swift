//
//  ProductDetailCollectionViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-30.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var detailmage: UIImageView!
    
    static let identifier = "ProductDetailCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        backgroundColor = .white
        detailmage.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(with details: DetailModel, indexPath: Int) {
        for _ in details.images {
            guard let url = URL(string: details.images[indexPath]) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            detailmage.image = UIImage(data: data)
        }
    }
}
