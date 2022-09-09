//
//  MyCartModel.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-02.
//

import Foundation

struct MyCartModel: Codable {
    let basket: [Basket]
    let delivery: String
    let id: String
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case total = "total"
        case delivery = "delivery"
        case basket = "basket"
        }
}

struct Basket: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "images"
        case price = "price"
        case title = "title"
        }
}
