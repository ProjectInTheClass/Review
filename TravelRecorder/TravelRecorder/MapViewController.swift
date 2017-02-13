//
//  MapViewController.swift
//  TravelRecorder
//
//  Created by CAUCSE on 2017. 2. 12..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    
    @IBAction func addLocation(_ sender: Any) {
        
    
        
        print("경로 추가 버튼을 눌렀습니다")
        // 경로 추가 팝업창 띄우기
        let alertController = UIAlertController(title: "경로를 추가해주세요", message: "상세경로는 지도에 표시됩니다", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (result : UIAlertAction) -> Void in
            print("경로 추가 취소버튼을 눌렀습니다")})
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { (result : UIAlertAction) -> Void in
            print("경로 추가 확인버튼을 눌렀습니다")})
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        // 팝업창에 텍스트필드 띄우기
        // placeholder은 필드 설명을 위한 내용
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "경로" })
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "상세경로" })
        
        self.present(alertController, animated: true, completion: nil)
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
