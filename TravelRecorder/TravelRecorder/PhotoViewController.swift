//
//  PhotoViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var PhotoTextView: UITextView!
    
    var photoInfos: Results<PhotoInfo>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try? Realm()
        self.photoInfos = realm?.objects(PhotoInfo.self)
    }
    
    @IBAction func clickSaveButton(_ sender: UIButton) {
        
        let realm = try? Realm()
        let photoInfo: PhotoInfo = PhotoInfo()
        
        if let image = self.PhotoImageView.image {
            photoInfo.imageData = UIImageJPEGRepresentation(image, 1.0)
        }
        
        if let text = self.PhotoTextView.text, text.characters.count > 0 {
            
            photoInfo.text = text
        }
        
        try? realm?.write {
            realm?.add(photoInfo)
        // 버튼이 바뀌는 부분
        }
    }
    @IBAction func clickAddButton(_ sender: UIButton) {
        print("Add Button이 Click 되었습니다.")
        
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "사진 선택", message: "사진을 가져오시겠습니까?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            print("사용자가 Cancel을 누름")
        })
        
        let libraryAction: UIAlertAction
        libraryAction = UIAlertAction(title: "사진 불러오기", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        })
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(libraryAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    func showImagePicker(type: UIImagePickerControllerSourceType) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("사용자가 사진을 선택했습니다")
        
        if let pickedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.PhotoImageView.image = pickedImage
            
        picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
