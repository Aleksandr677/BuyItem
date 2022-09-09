//
//  SearchTableViewCell.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-06.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifierSearchCell = "SearchTableViewCell"
    private let imageSearch = UIImageView(image: UIImage(systemName: "magnifyingglass"))

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var apperanceButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchTextField.layer.cornerRadius = 17
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)])
        
        imageSearch.contentMode = .scaleAspectFit
        imageSearch.tintColor = UIColor(named: "MyOrange")
        
        searchTextField.leftView = imageSearch
        searchTextField.leftViewMode = UITextField.ViewMode.always
        
        apperanceButton.layer.cornerRadius = 18
        
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
