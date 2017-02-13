//
//  ViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var events: Results<EventInfo>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController의 화면이 보여질 예정입니다")
        
        let realm = try? Realm()
        self.events = realm?.objects(EventInfo.self)
        self.tableView.reloadData()
        print("변경된 정보가 있는지 확인합니다")
        // 메인 화면을 띄우기 전에 새로고침하여, 테이블 뷰가 다시 row의 개수와 데이터를 요청한다.
    }
    
    
    
    // expandable & collapsible cell 추가
    
    

    
    
    
    
    // Swipe to delete cell 추가
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let realm = try? Realm()
        
        if let deletingInfo = self.events?[indexPath.row] {
            
            realm?.beginWrite()
            realm?.delete(deletingInfo)
            try? realm?.commitWrite()
            
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }


    
    
    
    
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.events?.count == 0 {    // 사용자가 입력한 데이터가 없을 시엔 추가를 위한 cell 한 개만 보여준다.
            return 1
        } else {
            return self.events?.count ?? 1  // 사용자가 입력한 데이터가 있을 시, 데이터 양만큼 보여준다.
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {     // 항상 메인 화면의 첫번째 cell은 추가 버튼을 보여준다.
            let cell: MyCustomerTableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "willExpandLabel", for: indexPath) as! MyCustomerTableViewCell
            
            return cell
        } else {
            let cell: UITableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
            
            
            // cell에 출력될 정보를 각각 label(IBOutlet으로 지정 후)로 연결 및 호출
            
            return cell
        }

    }
    
    
    
    
    
    
    
    // n일차 버튼을 누르면, 캘린더 팝오버와 뒷배경 블러처리를 한다.
    
    @IBOutlet var calendarPopView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        calendarPopView.layer.cornerRadius = 5
    }
    
    
    func animateIn () {
        self.view.addSubview(calendarPopView)
        // calendarPopView.center = self.view.center (위치 수정 후, 코드 추가하기)
        
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
    
    @IBAction func showCalendarButton(_ sender: Any) {
        
        animateIn()
    }
    
    
    @IBAction func dismissPopUp(_ sender: Any) {
    // 캘린더 팝오버에서 나오는 함수 - 문제는 이 이후에 다른 뷰로 넘어가야 함.
    
    
    }
    
    
    


}
