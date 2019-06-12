//
//  Extensions.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func downloadImageFrom(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url)
    }
    
    func downloadImageFrom(url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                self.image = imageToCache
            }
            }.resume()
        
    }
    
    
}
