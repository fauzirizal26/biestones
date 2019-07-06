//
//  DataAnakTableViewCell.swift
//  ProjectTeam1
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 29/04/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class DataAnakTableViewCell: UITableViewCell {
    

    @IBOutlet weak var imgAnak: UIImageView!
    @IBOutlet weak var lblAnak: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
