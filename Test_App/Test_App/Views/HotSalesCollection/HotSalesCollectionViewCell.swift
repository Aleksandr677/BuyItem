//
//  HotSalesCollectionViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-26.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HotSalesCollectionViewCell"
    
    @IBOutlet weak var newLabelView: UIView!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var phoneDescription: UILabel!
    @IBOutlet weak var buyNowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newLabelView.layer.cornerRadius = 13.5
        newLabel.text = "New"
        newLabelView.backgroundColor = UIColor(named: "MyOrange")
        newLabel.textColor = .white
        buyNowButton.layer.cornerRadius = 5
        
        backgroundColor = .black
        layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(with phones: [HotSalesPhone], indexPath: Int) {
        
        for _ in phones {
            if phones[indexPath].isNew == nil {
                newLabelView.isHidden = true
            }
            phoneName.text = phones[indexPath].title
            phoneDescription.text = phones[indexPath].subtitle
            
            guard let url = URL(string: phones[indexPath].picture) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            phoneImage.image = UIImage(data: data)
        }
    }
}


