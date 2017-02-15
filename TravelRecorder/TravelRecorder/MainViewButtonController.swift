//
//  MainViewButtonController.swift
//  TravelRecorder
//
//  Created by 임예진 on 2017. 2. 14..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewButtonController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var saveExitButton: UIButton!
    @IBOutlet weak var addEventPopOver: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveExitButton.layer.cornerRadius = saveExitButton.frame.size.width / 2
        
        
    }
    
    
    
    @IBOutlet weak var eventMainPic: UIImageView!
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var withWhomTextField: UITextField!
    
    
    @IBOutlet weak var fromYear: UITextField!
    @IBOutlet weak var fromMonth: UITextField!
    @IBOutlet weak var fromDay: UITextField!
    
    @IBOutlet weak var toYear: UITextField!
    @IBOutlet weak var toMonth: UITextField!
    @IBOutlet weak var toDay: UITextField!
    
    var eventInfoFromPrevController: EventInfo?
    
    @IBAction func dismissSecondVC(_ sender: Any) {
        
        let realm = try? Realm()
        
        // eventCreate에 새로운 EventInfo를 생성
        let eventCreate = EventInfo()
        
        
        // 여행 이벤트 생성 취소
        if (self.eventMainPic.image == nil) || (self.eventTitleTextField.text == nil) {
            
            let actionSheet: UIAlertController
            actionSheet = UIAlertController(title: "액션 선택", message: "여행 이벤트를 생성하기 위해 필요한 정보가 부족합니다. 이벤트 작성을 취소하시겠습니까?", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cancelAction: UIAlertAction
            cancelAction = UIAlertAction(title: "계속 작성하기", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
                print("사용자가 취소를 눌렀습니다.")
            })
            
            let quitAction: UIAlertAction
            quitAction = UIAlertAction(title: "이벤트 생성 취소", style: UIAlertActionStyle.destructive, handler: { (UIAlertAction) in
                
                self.view.window?.rootViewController?.dismiss(animated: true,completion: nil)
            })
            
            
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(quitAction)
            
            self.present(actionSheet, animated: true, completion: nil)
            
            return
        }
        
        
        // 여행 이벤트에 표시될 이미지 확인
        if let image = self.eventMainPic.image {
            
            print("사용자가 선택한 이미지가 있습니다")

            eventCreate.repPic = UIImageJPEGRepresentation(image, 1.0)
            
        }
        
        
        // 여행 이벤트 제목 확인
        if let title = self.eventTitleTextField.text, title.characters.count > 0 {
            
            eventCreate.eventTitle = title
            
        } else {
            
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "여행 이벤트 생성을위해서 제목을 입력해주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title:"확인", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        // 여행 동행 여부 확인
        if let coTraveller = self.withWhomTextField.text, coTraveller.characters.count > 0 {
            
            eventCreate.withWhom = coTraveller
            
        } else {
            
            let TravelAlone: String = "나홀로 여행"
            eventCreate.withWhom = TravelAlone
            
        }
        
        
        // 여행 날짜 변환 및 등록 (미완)
        
        
        
        // realm에게 eventCreate를 DB에 저장해달라고 요청
        if self.eventInfoFromPrevController == nil {
            
            try? realm?.write {
                realm?.add(eventCreate)
            }
            
        } else {
            
            try? realm?.commitWrite()
        }

        
        print("변경된 내용을 저장하고, 이벤트 추가 창을 닫습니다.")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "액션 선택", message: "원하는 액션을 선택해주세요.", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            print("사용자가 취소를 눌렀습니다.")
        })
        
        
        let libraryAction: UIAlertAction
        libraryAction = UIAlertAction(title: "갤러리에서 사진 가져오기", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            
            self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
            
        })
        
    
        let deleteAction: UIAlertAction
        deleteAction = UIAlertAction(title: "현재 사진 삭제", style: UIAlertActionStyle.destructive, handler: { (UIAlertAction) in
            
            self.eventMainPic.image = nil
            
        })
        
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(deleteAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    // 이미지피커 함수
    func showImagePicker(type:UIImagePickerControllerSourceType) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("사용자가 이미지를 선택했어요")
        
        if let pickedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {

            self.eventMainPic.image = pickedImage
        }
        
        
        // 피커를 화면에서 내려줍니다
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.endEditing(true)
        return true
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let info = self.eventInfoFromPrevController {
            
            if let imageData = info.repPic {
                self.eventMainPic?.image = UIImage(data: imageData, scale: 1.0)
            }
            
        }
        
    }
    
    
    
}
