//
//  ViewController.swift
//  UnSplashGallery
//
//  Created by liza_kaganskaya on 6/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
   
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var prevB: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos:[Photo] = []
    var presenter =  Presenter()
    var page:Int = 1
    var blurEffectView = UIVisualEffectView()
    var zoomView = UIView()
    var searchPressed:Bool = false
   
    
    @IBAction func prevBPressed(_ sender: Any) {

        self.page = self.page-1
        self.viewDidLoad()
    
    }
    
    @IBAction func nextBPressed(_ sender: Any) {
       
        self.page = self.page+1
        self.viewDidLoad()

    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        if self.page == 1 {
            prevB.isEnabled = false
            
        }else{
            prevB.isEnabled = true

        }
        if self.page == 10 {
            nextB.isEnabled = false
            
        }else{
            nextB.isEnabled = true
            
        }
        
        
        self.label.text = self.page.description
        
        presenter.view = self
        
        if !searchPressed {
            
            presenter.getPhotos(page:self.page)
            
        }else{
            
            presenter.search(page: self.page, query: searchField.text!)

        }
        
        collectionView.delegate = self
        collectionView.dataSource =  self
        
        searchField.delegate = self
        
        
    }

   
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate, MainView {
   
    func showQueryRes(photos: [Photo]){
        self.photos = photos
        
        self.collectionView.reloadData()
    }
    
    func showPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = true
    
        if (searchBar.text?.count)! >= 3{
        
        self.searchPressed = true

            self.viewDidLoad()}else{
            
            searchBar.text = "Enter more than 3 characters"
        }

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       
        searchBar.text = ""
        
        searchBar.showsCancelButton = false
        
        self.searchPressed = false
        
        self.viewDidLoad()
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var collectionViewSize = collectionView.bounds.size

        if !self.searchPressed {
            
            collectionViewSize.width = collectionViewSize.width/3.2
            collectionViewSize.height = collectionViewSize.width
        
        }else{
            collectionViewSize.height = collectionViewSize.width
        }
        
        return collectionViewSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! CollectionViewCell
        
        let url = self.photos[indexPath.row].urls.map({ i in i.thumb!})
        
            photoCell.image.downloadImageFrom(urlString:url!)
        
        return photoCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        let url = self.photos[indexPath.row].urls.map({ i in i.small! })
       
            blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
            self.view.addSubview(blurEffectView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        
            blurEffectView.addGestureRecognizer(tap)

        
            zoomView = UIView(frame: CGRect(x: 0, y: self.view.bounds.midY-150, width: self.collectionView.bounds.width, height: self.collectionView.bounds.height/2))

        let imvImage = UIImageView(frame: CGRect(x: zoomView.bounds.minX+10, y:zoomView.bounds.minY, width: zoomView.bounds.width-20, height: zoomView.bounds.height))
       
            imvImage.downloadImageFrom(urlString: url!)
        
            imvImage.contentMode = .scaleAspectFit

            zoomView.addSubview(imvImage)

     
            self.view.addSubview(zoomView)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.blurEffectView.removeFromSuperview()
        self.zoomView.removeFromSuperview()
    }
    

}
