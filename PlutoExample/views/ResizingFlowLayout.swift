//
//  ResizingFlowLayout.swift
//  Tshteeb
//
//  Created by Apple on 11/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class ResizingFlowLayout : UICollectionViewFlowLayout {
   var cellsPerRow = 2
   var height : CGFloat = 100
   init(insets : UIEdgeInsets) {
       super.init()
       self.sectionInset = insets
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   override func prepare() {
       super.prepare()
       guard let collectionView = collectionView else { return }
       setItemSize(collectionView: collectionView)
   }
   //    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
   //        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
   //        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
   //        return context
   //    }
    
    
    func setItemSize (collectionView : UICollectionView) {
        var marginsAndInsets : CGFloat = 0
        if #available(iOS 11.0, *) {
            marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        } else {
            // Fallback on earlier versions
            marginsAndInsets = sectionInset.left + sectionInset.right +  minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        }
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: height )
    }
    
}


