//
//  NthDayViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class NthDayViewController: UIViewController {

    
    // n일차 버튼을 누르면, 캘린더 팝오버와 뒷배경 블러처리를 한다.
    
    @IBOutlet var calendarPopView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view가 켜졌을 때, 블러 effect가 비활성화 상태이도록 지정
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        
        calendarPopView.layer.cornerRadius = 5
    }
    
    
    func animateIn () {
        self.view.addSubview(calendarPopView)
        calendarPopView.center = self.view.center // (위치 수정 후, 코드 추가하기)
        
        calendarPopView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        calendarPopView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            self.visualEffectView.effect = self.effect
            self.calendarPopView.alpha = 1
            self.calendarPopView.transform = CGAffineTransform.identity
        }
        
    }
    
    func animateOut () {
        UIView.animate(withDuration: 0.2, animations: {
            self.calendarPopView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            self.calendarPopView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) {    (success:Bool) in
            self.calendarPopView.removeFromSuperview()
        }
    }
    
    @IBAction func showCalendarButton(_ sender: AnyObject) {
        
        animateIn()
    }
    
    @IBAction func dismissPopUp(_ sender: AnyObject) {
        
        animateOut()
    }
    

}
