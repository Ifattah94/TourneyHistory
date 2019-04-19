//
//  MenuController.swift
//  tourneyHistory
//
//  Created by C4Q on 4/5/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    private let profileReuseIdentifier = "ProfileCell"
    private let reuseIdentifier = "MenuOptionCell"
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    
    
}
extension MenuController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
            
            let menuOption = MenuOption(rawValue: indexPath.row)
            cell.descriptionLabel.text = menuOption?.description
            cell.iconImageView.image = menuOption?.image
            
            return cell
       
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
    
}
