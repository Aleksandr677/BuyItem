//
//  Phone.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-29.
//

import Foundation
import UIKit

struct HomeStore: Codable {
    let home_store: [HotSalesPhone]
}

struct HotSalesPhone: Codable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isNew = "is_new"
        case title = "title"
        case subtitle = "subtitle"
        case picture = "picture"
        case isBuy = "is_buy"
        }
}



