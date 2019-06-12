//
//  Links.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
struct Links : Codable {
    let html : String?
    let photos : String?
    let likes : String?
    let portfolio : String?
    let following : String?
    let followers : String?
    
    enum CodingKeys: String, CodingKey {
        
        case html = "html"
        case photos = "photos"
        case likes = "likes"
        case portfolio = "portfolio"
        case following = "following"
        case followers = "followers"
}
}
