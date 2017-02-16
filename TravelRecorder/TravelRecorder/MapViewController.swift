//
//  MapViewController.swift
//  TravelRecorder
//
//  Created by CAUCSE on 2017. 2. 12..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift
import GooglePlaces

class MapViewController: UIViewController {
    
    var labelLocation: String? = nil
    
    @IBAction func addLocation(_ sender: Any) {
        
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
        
        
        /*
        print("경로 추가 버튼을 눌렀습니다")
        // 경로 추가 팝업창 띄우기
        let alertController = UIAlertController(title: "경로를 추가해주세요", message: "상세경로는 지도에 표시됩니다", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            print("경로 추가 취소버튼을 눌렀습니다")})
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            print("경로 추가 확인버튼을 눌렀습니다")
            
            if let label: String = alertController.textFields?[0].text {
                self.labelLocation = label
            }

            // 입력받은 경로 저장
            self.saveNewLocation()
        })
        
        // 팝업창에 텍스트필드 띄우기
        // placeholder은 필드 설명을 위한 내용
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "경로"
        })
       
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        self.present(alertController, animated: true, completion: nil)
        */
        
        
    }
    
/*
    func saveNewLocation() {
        print("새로 입력된 경로를 LocationInfo에 저장합니다")
        
        // 렘 초기화해서 realm 이름으로 사용
        let realm = try? Realm()
        
        // 경로 정보를 담을 locationInfo
        let labelInfo: Label = Label()
        
        // 라벨용 경로
        if let forLabel = self.labelLocation, NSString(string:forLabel).length > 0 {
            print("라벨용 경로가 입력돼있습니다")
            
            // 사용자가 작성한 라벨용 경로를 locationInfo에 저장
            labelInfo.labelLocation = forLabel

            
        } else {
            print("입력된 라벨용 경로가 없습니다")
            
            // 경로를 입력하지 않았다는 팝업창
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "경로를 입력하지 않았습니다", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
 
        
        try? realm?.write {
            realm?.add(labelInfo)
        }
        
        putLocationButtons()
    }
     */
    
    
    
    /*
    func putLocationButtons() {
        
        print("putLocationButtons들어옴")
        
        var locationInfo: Results<LocationInfo>?
        
        let realm = try? Realm()
        
        locationInfo = realm?.objects(LocationInfo.self)
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        
        
        
        let buttonStackView = UIStackView()
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = UIStackViewDistribution.equalSpacing
        //buttonStackView.alignment = UIStackViewAlignment.center
        buttonStackView.spacing = 8
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //buttonStackView.layoutMargins.left = 50
        buttonStackView.layoutMargins.top = 213
        
        
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        
        self.view.addSubview(buttonStackView)
        
        if locationInfo != nil {
            
            
            
            
            for loc in locationInfo! {
                
                let button = UIButton()
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
                button.setTitle(loc.labelLocation, for: .normal)
                button.sizeToFit()
                //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                
                buttonStackView.addArrangedSubview(button)
              
            }
            
            
        }
        
        
    }

    */

    
    
    func putLocationLabels() {
        
        var locationInfo: Results<LocationInfo>?
        
        let realm = try? Realm()
        
        locationInfo = realm?.objects(LocationInfo.self)
        
        var labelStr: String = ""
        
        if locationInfo != nil {
            
            for loc in locationInfo! {
                
                labelStr += loc.labelLocation
                labelStr += " → "
            }
            
            labelStr.characters.dropLast(3)
            /*
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.setTitle(labelStr, for: .normal)
            button.sizeToFit()
            */
            let label = UILabel(frame: CGRect(x: 45, y: 222, width: 0, height: 0))
            label.text = labelStr
            label.font = UIFont(name: label.font.fontName, size: 15)
            label.sizeToFit()
            
            self.view.addSubview(label)
        }
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putLocationLabels()
        
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



extension MapViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        let realm = try? Realm()
        let locationInfo: LocationInfo = LocationInfo()
        
        locationInfo.labelLocation = place.name
        locationInfo.latitude = place.coordinate.latitude
        locationInfo.longitude = place.coordinate.longitude
   
        try? realm?.write {
            realm?.add(locationInfo)
        }
        
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        print("Place coordinate: \(place.coordinate)")
        print("Place addressComponents: \(place.addressComponents)")
        
        putLocationLabels()
        
        dismiss(animated: true, completion: nil)
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}











