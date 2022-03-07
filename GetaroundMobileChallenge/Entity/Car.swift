//
//  Car.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 04/03/2022.
//

import Foundation

struct Car: Decodable {
    
    var brand: String
    var model: String
    var pictureUrl: String
    var pricePerDay: Int
    var rating: Rating
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case brand
        case model
        case pictureUrl = "picture_url"
        case pricePerDay = "price_per_day"
        case rating
        case owner
    }
    
}
