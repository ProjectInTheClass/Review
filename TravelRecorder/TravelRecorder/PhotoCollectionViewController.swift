//
//  PhotoCollectionViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        photoImageView = UIImageView(frame: contenView.frame)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        contentView.addSubview(photoImageView)
    }

    }
