//
//  HeaderView.swift
//  PlutoExample
//
//  Created by yusef naser on 9/15/20.
//  Copyright © 2020 Yusef. All rights reserved.
//

import UIKit

class HeaderView : UIView {
    
    var completion : ( (_ index : Int )->Void )?
    
    lazy var stackImage : UIStackView = {
       let s = UIStackView()
        s.spacing = 10
        s.axis = .vertical
        
        s.addArrangedSubview(userImage)
        s.addArrangedSubview(labelName)
        
        return s
    }()
    
    private let userImage : UIImageView = {
       let i = UIImageView()
        i.image = #imageLiteral(resourceName: "user")
        i.contentMode = .scaleAspectFill
        i.translatesAutoresizingMaskIntoConstraints = false
        i.heightAnchor.constraint(equalToConstant: 50).isActive = true
        i.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return i
    }()
    
    private let labelName : UILabel = {
        let l = UILabel ()
        l.text = "john"
        l.textAlignment = .center
        return l
    }()
    
    let l1 = UILabel ()
    let l2 = UILabel ()
    let l3 = UILabel ()
    
    private lazy var stackTabs : UIStackView = {
       let s = UIStackView()
        s.distribution = .fillEqually
        s.axis = .horizontal
        s.spacing = 10
        
        
        l1.textAlignment = .center
        l1.text = "First"
        
        
        l2.textAlignment = .center
        l2.text = "Second"

        
        l3.textAlignment = .center
        l3.text = "Third"

        s.addArrangedSubview(l1)
        s.addArrangedSubview(l2)
        s.addArrangedSubview(l3)
        
        return s
    }()
    
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
        self.backgroundColor = .gray
        l1.isUserInteractionEnabled = true
        l2.isUserInteractionEnabled = true
        l3.isUserInteractionEnabled = true
        l1.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(selectFirstTab)))
        l2.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(selectSecondTab)))
        l3.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(selectThirdTab)))
    }
    private func addViews () {
        
        addSubview(stackImage)
        addSubview(stackTabs)
        
        stackImage.translatesAutoresizingMaskIntoConstraints = false
        stackImage.centerXAnchor.constraint(equalTo: centerXAnchor , constant: 0).isActive = true
        stackImage.centerYAnchor.constraint(equalTo: centerYAnchor , constant: 0 ).isActive = true
        
        stackTabs.translatesAutoresizingMaskIntoConstraints = false
        stackTabs.bottomAnchor.constraint(equalTo: bottomAnchor , constant: 0).isActive = true
        stackTabs.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 0).isActive = true
        stackTabs.trailingAnchor.constraint(equalTo: trailingAnchor , constant: 0).isActive = true
        stackTabs.heightAnchor.constraint(equalToConstant: 50).isActive = true 
    }
    
    @objc private func selectFirstTab () {
        completion?(0)
    }
    
    @objc private func selectSecondTab () {
        completion?(1)
    }
    
    @objc private func selectThirdTab () {
        completion?(2)
    }
    
}
