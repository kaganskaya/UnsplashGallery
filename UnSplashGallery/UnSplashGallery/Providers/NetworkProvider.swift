//
//  NetworkProvider.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class NetworkProvider {
   
    let apiKey = "4c9fbfbbd92c17a2e95081cec370b4511659666240eb4db9416c40c641ee843b"
    
    
    
    func serachPhoto(query:String,page:Int) -> Observable<[Photo]> {
        
        let url = "https://api.unsplash.com/search/photos?query=\(query)&page=\(page)&per_page=30&client_id=\(apiKey)"
        
        let keyList = "results"
        
        return Observable<[Photo]>.create { observer  in
            
            let request = Alamofire
                
                .request(url, method: .get,encoding: JSONEncoding.default)
                
                .validate()
                
                .responseJSON { response in
                    
                    let value =  response.result.value as! NSDictionary
                    
                    if let listValues =  value[keyList] {
                        
                        
                        let decoder = JSONDecoder()
                        
                        if let data = try? JSONSerialization.data(withJSONObject: listValues as! NSArray , options:[]){
                            do{
                                
                                let content:[Photo] = try decoder.decode([Photo].self, from: data)
                               
                                observer.onNext(content)
                                observer.onCompleted()
                            }catch let er as NSError{
                                
                                observer.onError(er)
                            }
                        }else{
                            let error : NSError = NSError(
                                domain: "GlobalProvider",
                                code: -1,
                                userInfo: [NSLocalizedDescriptionKey:"error while serialization"])
                            
                            observer.onError(error)
                        }
                    } else{
                        let error : NSError = NSError(
                            domain: "GlobalProvider",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey:"Под данному запросу нету информации"])
                        
                        observer.onError(error)
                    }
                    
            }
            
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
        
    }
    
    func getPhotos(page:Int) -> Observable<[Photo]> {
        
        let url = "https://api.unsplash.com/photos?page=\(page)&per_page=30&client_id=\(apiKey)"
        
        return Observable<[Photo]>.create { observer  in
            
            let request = Alamofire
                
                .request(url, method: .get,encoding: JSONEncoding.default)
                
                .validate()
                
                .responseJSON { response in
                    
                    let value =  response.result.value
                    
                        
                        let decoder = JSONDecoder()
                        
                        if let data = try? JSONSerialization.data(withJSONObject: value , options:[]){
                            do{
                                
                                let content:[Photo] = try decoder.decode([Photo].self, from: data)
                                
                                observer.onNext(content)
                                observer.onCompleted()
                                
                            }catch let er as NSError{
                                
                                observer.onError(er)
                            }
                        }else{
                            let error : NSError = NSError(
                                domain: "GlobalProvider",
                                code: -1,
                                userInfo: [NSLocalizedDescriptionKey:"error while serialization"])
                            
                            observer.onError(error)
                        }

            }
            
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
        
    }
    
    
    
}
