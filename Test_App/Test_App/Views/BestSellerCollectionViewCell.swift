//
//  BestSallerCollectionViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-28.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BestSellerCollectionViewCell"
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.cornerRadius = 12.5
        layer.cornerRadius = 8
        backgroundColor = .white
        oldPriceLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(named: "ic-like"), for: .normal)
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(named: "ic-likeFilled"), for: .normal)
            likeButton.tag = 0
        }
    }
    
    func configureCell(with phones: [BestSellerPhone], indexPath: Int) {
        
        for _ in phones {
            if phones[indexPath].isFavorites != false {
                likeButton.setImage(UIImage(named: "ic-likeFilled"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "ic-like"), for: .normal)
            }
            
            oldPriceLabel.attributedText = String("$\(phones[indexPath].discountPrice)").strikeThrough()
            currentPriceLabel.text = String("$\(phones[indexPath].priceWithoutDiscount)")
            descriptionLabel.text = phones[indexPath].title
            
            if phones[indexPath].picture != nil {
                let url = URL(string: phones[indexPath].picture!)
                if let data = try? Data(contentsOf: url!) {
                    phoneImageView.image = UIImage(data: data)
                } else {
                    let url = URL(string: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")
                    let data = try? Data(contentsOf: url!)
                    phoneImageView.image = UIImage(data: data!)
                }
            }
        }
    }
}
