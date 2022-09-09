//
//  BestSellerPhone.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-29.
//

import Foundation
import UIKit

struct BestSeller: Codable {
    let best_seller: [BestSellerPhone]
}

struct BestSellerPhone: Codable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isFavorites = "is_favorites"
        case title = "title"
        case priceWithoutDiscount = "price_without_discount"
        case picture = "picture"
        case discountPrice = "discount_price"
        }
}
