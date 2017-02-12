//
//  GoogleMapsViewController.swift
//  TravelRecorder
//
//  Created by CAUCSE on 2017. 2. 12..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func loadView() {
        
        //// 지도 객체 추가
        
        // 지도의 중앙과 확대/축소 수준 지정
        let camera = GMSCameraPosition.camera(withLatitude: 10, longitude: 20, zoom: 6)
        
        // GMSCameraPosition 객체를 필수 매개변수로 전달
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // GMSMapView 객체를 뷰 컨트롤러의 뷰로 설정
        self.view = mapView
        
        
        //// 마커

        // 마커 추가
        let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        let marker = GMSMarker(position: position)
        marker.title = "Hello"
        marker.map = mapView
        
        // 마커 제거
        // GMSMarker 의 map속성을 nil로 설정 or GMSMapView Clear 메서드 호출
        
        // mapView.clear()
        
        // marker.map = nil
        
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
