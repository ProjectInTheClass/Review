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
    
    dynamic var eventStartDate: NSDate? = nil
    dynamic var eventFinishDate: NSDate? = nil
    dynamic var eventDuration: DateInterval? = nil
    
    dynamic var withWhom: String? = nil
    dynamic var repPic: Data? = nil
    
}
