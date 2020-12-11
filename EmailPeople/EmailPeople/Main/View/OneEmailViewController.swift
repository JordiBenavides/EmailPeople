//
//  OneEmailViewController.swift
//  EmailPeople
//
//  Created by Jordi Milla on 10/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class OneEmailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var id: Int?
    var viewModelOneEmail = ViewModelOneEmail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()

    }

    private func configureView() {
        guard let id = self.id else { return }
        viewModelOneEmail.requestEmailById(id: id)
    }

    private func bind() {
        viewModelOneEmail.refreshDataOneEmail = { [weak self] () in
            DispatchQueue.main.async {
                self?.updateLabels()
            }
        }
    }
    
    func updateLabels() {
        nameLabel.text = viewModelOneEmail.dataOneEmail.name
        genderLabel.text = viewModelOneEmail.dataOneEmail.gender
        statusLabel.text = viewModelOneEmail.dataOneEmail.status
        emailLabel.text = viewModelOneEmail.dataOneEmail.email
    }
}
