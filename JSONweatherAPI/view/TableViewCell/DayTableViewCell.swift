//
//  DayTableViewCell.swift
//  JSONweatherAPI
//
//  Created by Admin on 5/27/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDay: UILabel!
    
    @IBOutlet weak var imageWeather: UIImageView!
    
    @IBOutlet weak var lblTempMax: UILabel!
    
    @IBOutlet weak var lblTempMin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
