//
//  ViewController.swift
//  TravellerTrailer
//
//  Created by 임예진 on 2017. 2. 5..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // data source(open api) 정리 필요
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyCustomeTableViewCell
        cell = (tableView.dequeueReusableCell(withIdentifier: "showReviewListCell", for: indexPath) as! MyCustomeTableViewCell)
        
        return cell
    }
    
    
    
    
    
}


class locationResultPage: UIViewController {
    
}
