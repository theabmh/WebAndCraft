//
//  Home.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let status: Bool?
    let homeData: [HomeDatum]?
}

// MARK: - HomeDatum
struct HomeDatum: Codable {
    let type: CellType?
    let values: [Value]?
}

// MARK: - Value
struct Value: Codable {
    let id: Int?
    let name: String?
    let imageURL, bannerURL: String?
    let image: String?
    let actualPrice, offerPrice: String?
    let offer: Int?
    let isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}
enum CellType: String, Codable{
    case category
    case banners
    case products
}
