//
//  SelectCategoryModel.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-23.
//

import Foundation
import UIKit

struct SelectCategoryModel {
    let circleView: UIImageView
    let itemImage: UIImage
    let itemName: String
    
    //manually create categories
    static func fetchItem() -> [SelectCategoryModel] {

        let firstItem = SelectCategoryModel(circleView: UIImageView(), itemImage: UIImage(named: "ic-phone")!, itemName: "Phones")
        
        let secondItem = SelectCategoryModel(circleView: UIImageView(), itemImage: UIImage(named: "ic-computer")!, itemName: "Computer")
        
        let thirdItem = SelectCategoryModel(circleView: UIImageView(), itemImage: UIImage(named: "ic-heart")!, itemName: "Health")
        
        let fourthItem = SelectCategoryModel(circleView: UIImageView(), itemImage: UIImage(named: "ic-books")!, itemName: "Books")
        
        let fifthItem = SelectCategoryModel(circleView: UIImageView(), itemImage: UIImage(systemName: "gamecontroller")!, itemName: "Games")
        
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}
