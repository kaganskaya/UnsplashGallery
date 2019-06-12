//
//  Protocol.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation

protocol MainView:class {
    func showPhotos(photos:[Photo])
    func showQueryRes(photos: [Photo])
}
