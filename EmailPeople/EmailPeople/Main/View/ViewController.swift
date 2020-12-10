//
//  ViewController.swift
//  EmailPeople
//
//  Created by Jordi Milla on 06/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//
import Foundation
import UIKit
import Moya

class EmailPeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelEmailPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
        setTable()
     
    }
    
    private func configureView() {
    viewModel.retriveDataEmailPeople()
    }
    
    private func bind(){
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let emailPeople = viewModel.dataArray[indexPath.row]
        cell?.configure(emailPeople: emailPeople)
        return cell ?? UITableViewCell()
        
    }

}

