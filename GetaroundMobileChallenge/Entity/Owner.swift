//
//  Owner.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 04/03/2022.
//

import Foundation

struct Owner: Decodable {
    
    var name: String
    var pictureUrl: String
    var rating: Rating
    
    enum CodingKeys: String, CodingKey {
      case name
      case pictureUrl = "picture_url"
      case rating
    }
    
}
