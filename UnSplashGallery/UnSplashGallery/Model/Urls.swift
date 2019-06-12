//
//  Urls.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
struct Urls : Codable {
    let raw : String?
    let full : String?
    let regular : String?
    let small : String?
    let thumb : String?
    
    enum CodingKeys: String, CodingKey {
        
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
}
}
