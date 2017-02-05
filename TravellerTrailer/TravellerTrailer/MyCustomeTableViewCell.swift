//
//  MyCustomeTableViewCell.swift
//  TravellerTrailer
//
//  Created by 임예진 on 2017. 2. 5..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class MyCustomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet var movieTitleHomeLabel: UILabel!
    @IBOutlet weak var locationHomeLabel: UILabel!
    

}
