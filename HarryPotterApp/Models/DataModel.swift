//
//  DataModel.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 05.01.25.
//

import Foundation

struct ProductModel: Codable {
    var image: String?
    var name: String?
    var house: String?
    var price: String?
    var category: CategoryModel?
}

struct CategoryModel: Codable {
    var name: String?
    var image: String?
    var isSelected: Bool
}
