//
//  FirstCell.swift
//  Example
//
//  Created by yusef naser on 6/13/20.
//  Copyright © 2020 yusef naser. All rights reserved.
//

import UIKit
import Pluto

class FirstTab : ScrollViewTab {
    
    
    private let firstView : UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()
       
    private let secondView : UIView = {
        let v = UIView()
        v.backgroundColor = .brown
        return v
    }()
       
    private let thirdView : UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        return v
    }()
       
    private let fourthView : UIView = {
        let v = UIView ()
        v.backgroundColor = .blue
        return v
    }()
       
    private lazy var stackViews : UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 20
        s.distribution = .fillEqually
           
        s.addArrangedSubview(firstView)
//        s.addArrangedSubview(secondView)
//        s.addArrangedSubview(thirdView)
//        s.addArrangedSubview(fourthView)
           
        firstView.heightAnchor.constraint(equalToConstant: 250).isActive = true
           
        return s
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initViews () {
        addViews()
    }
    private func addViews () {
        
        parentView.addSubview(stackViews)
        stackViews.translatesAutoresizingMaskIntoConstraints = false
        stackViews.topAnchor.constraint(equalTo: parentView.topAnchor , constant: 8 ).isActive = true
        stackViews.leadingAnchor.constraint(equalTo: parentView.leadingAnchor , constant: 8).isActive = true
        stackViews.trailingAnchor.constraint(equalTo: parentView.trailingAnchor , constant: -8).isActive = true
        
        self.addBottomAnchor(view: stackViews , constant: 8)
      
        
    }
    
}
