//
//  User.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
struct User : Codable {
    let id : String?
    let updated_at : String?
    let username : String?
    let name : String?
    let first_name : String?
    let last_name : String?
    let twitter_username : String?
    let portfolio_url : String?
    let bio : String?
    let location : String?
    let links : Links?
    let profile_image : Profile_image?
    let instagram_username : String?
    let total_collections : Int?
    let total_likes : Int?
    let total_photos : Int?
    let accepted_tos : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case updated_at = "updated_at"
        case username = "username"
        case name = "name"
        case first_name = "first_name"
        case last_name = "last_name"
        case twitter_username = "twitter_username"
        case portfolio_url = "portfolio_url"
        case bio = "bio"
        case location = "location"
        case links = "links"
        case profile_image = "profile_image"
        case instagram_username = "instagram_username"
        case total_collections = "total_collections"
        case total_likes = "total_likes"
        case total_photos = "total_photos"
        case accepted_tos = "accepted_tos"
}
}
