//
//  Presenter.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift

class Presenter{
    
    var np = NetworkProvider()
    private var disposeBag = DisposeBag()
    weak var view:MainView?
    
    func getPhotos(page:Int) {
        
        np.getPhotos(page:page).subscribe(
                onNext: { n in
                
                    self.view?.showPhotos(photos: n)
                    
                    
        }, onError: { err in
            print(err.localizedDescription)
            
        }, onCompleted: {
            //print(" onCompleted")
       }, onDisposed: {
        //print("onDisposed")
        }).disposed(by: disposeBag)
    
    }
    func search(page:Int,query:String){
        
        
        np.serachPhoto(query: query, page: page).subscribe(
            onNext: { n in
                
                self.view?.showQueryRes(photos: n)
                
                
        }, onError: { err in
            print(err.localizedDescription)
            
        }, onCompleted: {
            //print(" onCompleted")
        }, onDisposed: {
            //print("onDisposed")
        }).disposed(by: disposeBag)
        
    }

}
