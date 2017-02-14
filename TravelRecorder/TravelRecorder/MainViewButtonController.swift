//
//  MainViewButtonController.swift
//  TravelRecorder
//
//  Created by 임예진 on 2017. 2. 14..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewButtonController: UIViewController {

    @IBOutlet weak var saveExitButton: UIButton!
    @IBOutlet weak var addEventPopOver: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveExitButton.layer.cornerRadius = saveExitButton.frame.size.width / 2
        
        
        self.reloadInputViews()
    }
    
    
    
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
        
        let eventCreate = EventInfo()
        
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
        var departCal = Date()
        var arrivCal = Date()
        
        
        // realm에게 photoInfo를 DB에 저장해달라고 요청
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


}
