//
//  CustomTableViewCell.swift
//  EmailPeople
//
//  Created by Jordi Milla on 10/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var data: EmailPeople?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(emailPeople: EmailPeople) {
        self.data = emailPeople
        nameLabel.text = data?.name ?? ""
        genderLabel.text = data?.gender ?? ""
        emailLabel.text = data?.email ?? ""
        statusLabel.text = data?.status ?? ""
    }
}
