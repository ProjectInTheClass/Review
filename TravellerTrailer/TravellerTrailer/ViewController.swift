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





class movieResultPage: UIViewController {
    
}





class userReviewInputPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "영화 제목 및 지역 등록"
        } else if section == 1 {
            return "영화와 지역에 대한 리뷰"
        } else {
            return "사진 등록 (선택)"
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else {
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell: MyCustomeTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "reviewInfoTypingCell", for: indexPath) as! MyCustomeTableViewCell
        
        return cell
        
    }
    
    
}
