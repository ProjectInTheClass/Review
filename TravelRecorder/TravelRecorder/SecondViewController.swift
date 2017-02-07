//
//  SecondViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 7..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
  
    @IBAction func clickEditButton(_ sender: Any) {
        
        print("edit버튼이 눌렸습니다")
        
        if let EditViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditView") {
            
            self.present(EditViewController, animated: true, completion: {
                print("edit화면이 올라옵니다")})
        }
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
