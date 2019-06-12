//
//  Photo.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
struct Photo : Codable {
    let id : String?
    let created_at : String?
    let updated_at : String?
    let width : Int?
    let height : Int?
    let color : String?
    let description : String?
    let alt_description : String?
    let urls : Urls?
    let links : Links?
    let categories : [String]?
    let sponsored : Bool?
    let sponsored_by : Sponsored_by?
    let sponsored_impressions_id : String?
    let likes : Int?
    let liked_by_user : Bool?
    let current_user_collections : [String]?
    let user : User?
    let sponsorship : Sponsorship?
    let tags : [Tags]?

    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case width = "width"
        case height = "height"
        case color = "color"
        case description = "description"
        case alt_description = "alt_description"
        case urls = "urls"
        case links = "links"
        case categories = "categories"
        case sponsored = "sponsored"
        case sponsored_by = "sponsored_by"
        case sponsored_impressions_id = "sponsored_impressions_id"
        case likes = "likes"
        case liked_by_user = "liked_by_user"
        case current_user_collections = "current_user_collections"
        case user = "user"
        case sponsorship = "sponsorship"
        case tags = "tags"

}
}
