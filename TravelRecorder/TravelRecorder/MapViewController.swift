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
            self.saveNewLocation()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        // 팝업창에 텍스트필드 띄우기
        // placeholder은 필드 설명을 위한 내용
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "경로"
            
            // textField자체가 아니라 textField.text를 저장해야한다
            self.labelLocation = textField.text
        })
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "상세경로"
            self.detailLocation = textField.text
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func saveNewLocation() {
        print("새로 입력된 경로를 LocationInfo에 저장합니다")
        
        // 렘 초기화해서 realm 이름으로 사용
        let realm = try? Realm()
        
        // 경로 정보를 담을 locationInfo
        let locationInfo: LocationInfo = LocationInfo()
        
        if let forLabel = self.labelLocation, NSString(string:forLabel).length > 0 {
            print("라벨용 경로가 입력돼있습니다")
            print(forLabel)
            
            locationInfo.labelLocation = forLabel
        } else {
            print("입력된 라벨용 경로가 없습니다")
            return
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
