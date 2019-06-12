//
//  Tags.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation

struct Tags : Codable {
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
}
}
