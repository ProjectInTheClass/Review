//
//  EventInfo.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import Foundation
import RealmSwift

class EventInfo: Object {
    
    dynamic var eventTitle: String? = nil
    dynamic var eventDate: Date = Date()
    dynamic var withWhom: String? = nil
    
}
