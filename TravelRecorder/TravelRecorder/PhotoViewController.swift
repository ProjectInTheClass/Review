//
//  PhotoViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    var photoInfos: Results<PhotoInfo>?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        let realm = try? Realm()
        self.photoInfos = realm?.objects(PhotoInfo.self)
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = self.photoInfos?.count {
            return count + 1
        }
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            
            var itemSize = self.collectionView.bounds.size
            itemSize.height = (itemSize.height - 10)
            itemSize.width = (itemSize.height) / 5.0
            return itemSize
            
        } else {
            var itemSize = self.collectionView.bounds.size
            itemSize.height = (itemSize.height - 10)
            itemSize.width = itemSize.height
            
            return itemSize
        }
        
    }
    

    
//    func collectionView(_ collectionViewLayout: UICollectionViewLayout) {
//        var collectionViewContentSize = CGSize{
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            
            let cell: UICollectionViewCell
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoAddCell", for: indexPath)
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
            if let info = self.photoInfos?[indexPath.item - 1] {
                if let imageData = info.imageData {
                    cell.imageView.image = UIImage(data: imageData)
                }
                if let text = info.text {
                    cell.textView.text = text
                }
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        if let photoEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "Edit") as? PhotoEditViewController,
            let photoInfo = self.photoInfos?[indexPath.item - 1] {
            
            photoEditViewController.photoInfoFromPrevController = photoInfo
            
            self.present(photoEditViewController, animated: true, completion: nil)
        }
        return false
    }
    

    @IBAction func tapAddCell(_ sender: UITapGestureRecognizer) {
        if let PhotoEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "Edit") {
            self.present(PhotoEditViewController, animated: true, completion: nil)
        }
        
    }

    @IBAction func tapPhotoCell(_ sender: UITapGestureRecognizer) {
        
//        if let photoEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "Edit") {
//            
//            self.present(photoEditViewController, animated: true, completion: nil)
//        }
        
        
    }
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    
}
