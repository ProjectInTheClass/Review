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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveExitButton.layer.cornerRadius = saveExitButton.frame.size.width / 2
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
