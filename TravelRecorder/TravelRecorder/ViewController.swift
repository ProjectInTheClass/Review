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

    struct Event {
        
        var eventTitle: String
        var eventDate = Date()
        var withWhom: String
        var collapsed: Bool!
    
        init(eventTitle: String, withWhom: String, collapsed: Bool = false) {
            self.eventTitle = eventTitle
            self.withWhom = withWhom
            self.collapsed = collapsed
        }
    }
    
    
    var events = [Event]()
    
    
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
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

