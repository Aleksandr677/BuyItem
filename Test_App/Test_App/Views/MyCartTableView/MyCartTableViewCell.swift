//
//  MyCartTableViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-03.
//

import UIKit

protocol MyCartTableViewCellDelegate: AnyObject {
    func didTapStepper()
}
class MyCartTableViewCell: UITableViewCell {
    
    weak var delegate: MyCartTableViewCellDelegate?

    @IBOutlet weak var cartImagePhone: UIImageView!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartImageLabel: UILabel!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepperView: UIView!
    public var itemCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cartImagePhone.layer.cornerRadius = 10
        stepperView.layer.cornerRadius = 10
    }
    
    @IBAction func stepperMinusButtonPressed(_ sender: UIButton) {
        guard itemCount > 0 else { return }
        itemCount -= 1
        DispatchQueue.main.async { [weak self] in
            self?.stepperLabel.text = String(self!.itemCount)
        }
    }
    
    @IBAction func stepperPlusButtonPressed(_ sender: UIButton) {
        itemCount += 1
        DispatchQueue.main.async { [weak self] in
            self?.stepperLabel.text = String(self!.itemCount)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func configureCell(with info: MyCartModel, at indexPath: Int) {
        cartImageLabel.text = info.basket[indexPath].title
        cartPriceLabel.text = String("$\(info.basket[indexPath].price).00")
        
        guard let url = URL(string: info.basket[indexPath].images) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        cartImagePhone.image = UIImage(data: data)
    }
}
