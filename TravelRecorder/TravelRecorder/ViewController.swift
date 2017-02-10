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
        // 메인 화면을 띄우기 전에 새로고침항, 테이블 뷰가 다시 row의 개수와 데이터를 요청한다.
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
        return self.events?.count ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell: MyCustomerTableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "willExpandLabel", for: indexPath) as! MyCustomerTableViewCell
            return cell
        } else {
            let cell: UITableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
            return cell
        }

    }
    
    
    
    
    
    
    
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

