//
//  AllGroupsTableViewCell.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 05/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
