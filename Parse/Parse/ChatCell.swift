//
//  ChatCell.swift
//  ParseChat
//
//  Created by Angel Chara'e Mitchell on 2/27/18.
//  Copyright © 2018 Angel Chara'e Mitchell. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var savedMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
