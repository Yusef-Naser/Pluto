//
//  ThirdCell.swift
//  Example
//
//  Created by yusef naser on 6/13/20.
//  Copyright © 2020 yusef naser. All rights reserved.
//

import UIKit
import PlutoView

class ThirdTab : CollectionViewTab {
    
    var imageData : [UIImage] = []
    
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
        collectionView.collectionViewLayout = ResizingFlowLayout(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CellImage.self , forCellWithReuseIdentifier: "cell")
        
        for i in 0 ... 20 {
            if (i % 2 == 0) {
                imageData.append(#imageLiteral(resourceName: "yuliya-kosolapova-xNDFrCge8c4-unsplash (1)"))
            }else {
                imageData.append(#imageLiteral(resourceName: "zhu-hongzhi-eT_rrCbvcqg-unsplash (1)"))
            }
        }
        
    }
    
    private func addViews () {
        
    }
    
}

extension ThirdTab : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellImage
        cell.image.image = imageData[indexPath.row]
        return cell
    }
    
    
}

class CellImage : UICollectionViewCell {
    
    let image: UIImageView = {
       let i = UIImageView()
        i.contentMode = .scaleAspectFill
        return i
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
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    private func addViews () {
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: 0).isActive = true
        
    }
    
}
