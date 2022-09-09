//
//  DetailModel.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-09-02.
//

import Foundation

struct DetailModel: Codable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case CPU = "CPU"
        case camera = "camera"
        case capacity = "capacity"
        case color = "color"
        case id = "id"
        case images = "images"
        case isFavorites = "isFavorites"
        case price = "price"
        case rating = "rating"
        case sd = "sd"
        case ssd = "ssd"
        case title = "title"
        }
}
