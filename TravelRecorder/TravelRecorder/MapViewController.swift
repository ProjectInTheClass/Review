//
//  MapViewController.swift
//  TravelRecorder
//
//  Created by CAUCSE on 2017. 2. 12..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class MapViewController: UIViewController {
    
    var labelLocation: String? = nil
    var detailLocation: String? = nil
    
    
    @IBAction func addLocation(_ sender: Any) {
        
        
        
        print("경로 추가 버튼을 눌렀습니다")
        // 경로 추가 팝업창 띄우기
        let alertController = UIAlertController(title: "경로를 추가해주세요", message: "상세경로는 지도에 표시됩니다", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            print("경로 추가 취소버튼을 눌렀습니다")})
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            print("경로 추가 확인버튼을 눌렀습니다")
            
            if let label: String = alertController.textFields?[0].text {
                self.labelLocation = label
            }
            if let detail: String = alertController.textFields?[1].text {
                self.detailLocation = detail
            }
            

            // 입력받은 경로 저장
            self.saveNewLocation()
        })
        
        // 팝업창에 텍스트필드 띄우기
        // placeholder은 필드 설명을 위한 내용
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "경로"
            // textField자체가 아니라 textField.text를 저장해야한다
            //self.labelLocation = textField.text
            //print(self.labelLocation)
        })
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "상세경로"
            //self.detailLocation = textField.text
        })
       
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    

    func saveNewLocation() {
        print("새로 입력된 경로를 LocationInfo에 저장합니다")
        
        // 렘 초기화해서 realm 이름으로 사용
        let realm = try? Realm()
        
        // 경로 정보를 담을 locationInfo
        let locationInfo: LocationInfo = LocationInfo()
        
        // 라벨용 경로
        if let forLabel = self.labelLocation, NSString(string:forLabel).length > 0 {
            print("라벨용 경로가 입력돼있습니다")
            
            // 사용자가 작성한 라벨용 경로를 locationInfo에 저장
            locationInfo.labelLocation = forLabel

            
        } else {
            print("입력된 라벨용 경로가 없습니다")
            
            // 경로를 입력하지 않았다는 팝업창
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "경로를 입력하지 않았습니다", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
 
        
        // 상세경로
     
        if let forDetail = self.detailLocation, forDetail.characters.count > 0 {
            print("상세 경로가 입력돼있습니다")
            
            // 사용자가 작성한 상세경로를 locationInfo에 저장
            locationInfo.detailLocation = forDetail
        } else {
            print("입력된 상세경로가 없습니다")
        }
        
        try? realm?.write {
            realm?.add(locationInfo)
        }
        
        putLocationButtons()
    }

    
    
    func putLocationButtons() {
        
        var locationInfo: Results<LocationInfo>?
        
        let realm = try? Realm()
        
        locationInfo = realm?.objects(LocationInfo.self)
        
        var constantX = 18
        var constantY = 50
        
        if locationInfo != nil {
            
            for loc in locationInfo! {
                
                // 글자하나 width 5로 잡아봄
                let buttonWidth = loc.labelLocation.characters.count * 10
                
                // 라벨당 간격 4
                
                constantX = constantX + buttonWidth
                
                // 수정 요함
                let buttonX = constantX
                let buttonY = constantY
                
                let button = UIButton()
                button.backgroundColor = .gray
                button.setTitle(loc.labelLocation, for: .normal)
                button.sizeToFit()
                //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
                
                self.view.addSubview(button)
                
            }
        }
        
        
    }

    

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putLocationButtons()
        
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
