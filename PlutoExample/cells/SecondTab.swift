//
//  SecondCell.swift
//  Example
//
//  Created by yusef naser on 6/13/20.
//  Copyright © 2020 yusef naser. All rights reserved.
//

import UIKit
import Pluto

class SecondTab : TableViewTab {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    private func initViews () {
        addViews()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell" )
        tableView.backgroundColor = .white
    }
    private func addViews () {
        
    }
    
}

extension SecondTab : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = "index : \(indexPath.row)"
        cell.textLabel?.textColor = .black
        return cell
    }
    
    
}
