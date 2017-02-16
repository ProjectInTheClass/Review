//
//  LocationInfo.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import Foundation
import RealmSwift

class Label: Object {
    dynamic var labelLocation = ""
    
}

class Detail: Object {
    dynamic var detailLocation = ""
    dynamic var simpleLocation = ""
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
}
