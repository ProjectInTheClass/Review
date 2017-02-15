//
//  EventsTableViewCell.swift
//  TravelRecorder
//
//  Created by 임예진 on 2017. 2. 15..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var eventsRepImage: UIImageView!
    
    @IBOutlet weak var eventPeriodOutput: UILabel!
    @IBOutlet weak var eventTitleOutput: UILabel!
    @IBOutlet weak var eventWithWhomOutput: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
