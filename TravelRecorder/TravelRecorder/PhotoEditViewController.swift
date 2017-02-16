//
//  PhotoEditViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoEditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoInfoFromPrevController: PhotoInfo?
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var TextField: UITextView!
    @IBAction func clickSaveButton() {
        
        var realm: Realm? = nil
        
        do {
            try realm = Realm()
        } catch {
            print(error)
            print(error.localizedDescription)
        }
        
        let photoInfo: PhotoInfo
        
        if let fromPrev = self.photoInfoFromPrevController {
            photoInfo = fromPrev
            
            realm?.beginWrite() //기존의 사진 정보에 정보 수정하기 위해 호출해줌
            
        } else {
            photoInfo = PhotoInfo()
        }
        if let image = self.selectedImage.image {
            
            photoInfo.imageData = UIImageJPEGRepresentation(image, 1.0)
            
        } else {
            
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "사진을 선택해주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        if let text = self.TextField.text, text.characters.count > 0 {
            
            photoInfo.text = text
            
        } else {
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "텍스트를 입력해주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        if self.photoInfoFromPrevController != nil {
            do {
                try realm?.commitWrite()
                self.dismiss(animated: true, completion: nil)
            } catch {
                print(error)
                print(error.localizedDescription)
            }
            
        } else {
        
            do {
                try realm?.write {
                    realm?.add(photoInfo)
                    self.dismiss(animated: true, completion: nil)
                }
            } catch {
                print(error)
                print(error.localizedDescription)
            }
        }
        
//        try? realm?.write {
//            realm?.add(photoInfo)
//            
//        }
        
        
    }
    
    @IBAction func clickCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        print("이미지를 탭했당")
        self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        
        
    }
    
    func showImagePicker(type: UIImagePickerControllerSourceType) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.selectedImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func textViewShouldReturn(_ textField: UITextView) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let info = self.photoInfoFromPrevController {
            self.TextField.text = info.text
            if let imageData = info.imageData {
                self.selectedImage?.image = UIImage(data: imageData, scale: 1.0)
            }
            
        }
    }
    
    
    
    @IBAction func clickDeleteButton(_ sender: UIButton) {
        
        let realm = try? Realm()
        
        let alert: UIAlertController
        alert = UIAlertController(title: "경고", message: "삭제하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
        let deleteAction: UIAlertAction
        deleteAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.destructive, handler: { (UIAlertAction) in
            if let photoInfo = self.photoInfoFromPrevController {
                try! realm?.write {
                    realm?.delete(photoInfo)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
        
        return
        
      
            
            
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
