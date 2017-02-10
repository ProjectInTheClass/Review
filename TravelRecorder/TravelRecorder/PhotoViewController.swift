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
    
    @IBAction func clickAddButton(_ sender: UIButton) {
        print("Add Button이 Click 되었습니다.")
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "사진 선택", message: "사진을 가져오시겠습니까?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            print("사용자가 Cancel을 누름")
            
        
        })
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
