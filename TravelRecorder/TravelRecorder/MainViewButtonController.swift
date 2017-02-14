//
//  MainViewButtonController.swift
//  TravelRecorder
//
//  Created by 임예진 on 2017. 2. 14..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class MainViewButtonController: UIViewController {

    @IBOutlet weak var saveExitButton: UIButton!
    @IBOutlet var pOView: UIView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 이벤트 추가 viewController의 사이즈를 조정합니다.
        func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
            let screenBounds = UIScreen.main.bounds
            
            let size = CGSize(width: screenBounds.width - 20 , height: 500)
            
            return size
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveExitButton.layer.cornerRadius = saveExitButton.frame.size.width / 2
        pOView.layer.cornerRadius = 15
        
        self.reloadInputViews()
    }
    
    

    @IBAction func dismissSecondVC(_ sender: Any) {
        
        print("이벤트 추가 창을 닫습니다.")
        self.dismiss(animated: true, completion: nil)
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
