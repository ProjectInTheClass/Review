//
//  AddEventViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var saveExitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveExitButton.layer.cornerRadius = saveExitButton.frame.size.width / 2
    }
    
    
    @IBOutlet weak var titleInputField: UITextField!
    @IBOutlet weak var withInputField: UITextField!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyCustomerTableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "willSaveAndExitCell", for: indexPath) as! MyCustomerTableViewCell
            return cell
        } else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "eventTitleInputCell", for: indexPath) as! MyCustomerTableViewCell
            return cell
        } else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "eventWithInputCell", for: indexPath) as! MyCustomerTableViewCell
            return cell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "eventShowingPicInput", for: indexPath) as! MyCustomerTableViewCell
            return cell
        }

    }
    
    
    // 이미지 탭해서 사진 추가하는 것 필요
    
    
    
    
    
    
    
    
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
