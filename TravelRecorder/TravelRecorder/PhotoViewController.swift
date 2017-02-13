//
//  PhotoViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    var photoInfos: Results<PhotoInfo>?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        let realm = try? Realm()
        self.photoInfos = realm?.objects(PhotoInfo.self)
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoInfos?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        
        if let info = self.photoInfos?[indexPath.item] {
            if let imageData = info.imageData {
                cell.imageView.image = UIImage(data: imageData)
            }
            
            }
        return cell
        }
        
    


    @IBAction func tapPhotoCell(_ sender: UITapGestureRecognizer) {
        
        if let photoEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "Edit") {
            self.present(photoEditViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    
}
