//
//  GoogleMapsViewController.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//


// AppDelegate에서 import GoogleMaps, didFinishLausnchingWithOptions에
// GMSServices .provideAPIKey("AIzaSyBa06ump9OiB70cFktQQOnbfMiGGgdihUg") 삽입해 API 키 제공



import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    
    // 이 뷰 컨트롤러가 보이게 될 때 지도에 표시하려면 loadView 메서드 내에서 생성
    override func loadView() {
        
        //// 지도 추가
        
        // GMSCameraPosition 객체 생성 - 지도의 중앙과 확대/축소 수준을 지정
        // GMSMapView객체 인스턴스화할 때 GMSCameraPosition객체를 필수 매개변수로 전달! (camera)
        let camera = GMSCameraPosition.camera(withLatitude: 10, longitude: 10, zoom: 12)
  
        // 이 지도가 뷰 컨트롤러의 유일한 뷰로 사용될 경우 CGRectZero가 지도의 프레임으로 사용될 수 있다. 지도 크기 자동 조절 -> 무슨말인지 이해가 잘안감
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
       
        self.view = mapView
        
        
        
        //// 마커 추가
        
        // 마커 좌표
        let position = CLLocationCoordinate2DMake(10, 10)
        let marker = GMSMarker(position: position)
        marker.title = "Hello World"
        
        // 기존 GMSmapView 객체에 마커 추가
        marker.map = mapView
        
        // 지도에 새 마커 추가하는 동작을 애니메이트
        //marker.appearAnimation = kGMSMarkerAnimationPop
    
    
    
        //// 마커 제거
        // GMSMarker의 map 속성을 nil로 설정
        marker.map = nil
        
        // GMSMapView clear 메서드 호출 -> 지도에 있는 모든 오버레이 제거
        //mapView.clear()
    
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
