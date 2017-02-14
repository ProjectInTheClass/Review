//
//  ViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var events: Results<EventInfo>?
    
    
    // 메인 화면을 띄우기 전에 새로고침하여, 테이블 뷰가 다시 row의 개수와 데이터를 요청한다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController의 화면이 보여질 예정입니다")
        
        let realm = try? Realm()
        self.events = realm?.objects(EventInfo.self)
        self.tableView.reloadData()
        print("변경된 정보가 있는지 확인합니다")
    }
    
    
    
    
    // 이벤트 추가 페이지로 연결
    @IBOutlet weak var addEventButton: UIButton!
    
    let transition = ButtonTransitionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEventButton.layer.cornerRadius = addEventButton.frame.size.width / 2
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! MainViewButtonController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = addEventButton.center
        transition.recColor = addEventButton.backgroundColor!
        
        return transition
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = addEventButton.center
        transition.recColor = addEventButton.backgroundColor!
        
        return transition
    }
    
    

    
    
    
    
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


    
    
    
    
    
    // 메인 뷰의 테이블셀(여행 이벤트) 정렬
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.events?.count == 0 {    // 사용자가 입력한 데이터가 없을 시엔 추가를 위한 cell 한 개만 보여준다.
            return 1
        } else {
            return self.events?.count ?? 1  // 사용자가 입력한 데이터가 있을 시, 데이터 양만큼 보여준다.
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
            
            
        // cell에 출력될 정보를 각각 label(IBOutlet으로 지정 후)로 연결 및 호출
            
        return cell

    }
    
    
    
    

    
    


}
