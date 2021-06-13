//
//  ViewController.swift
//  PlutoExample
//
//  Created by yusef naser on 9/15/20.
//  Copyright © 2020 Yusef. All rights reserved.
//

import UIKit
import PlutoView

class ViewController: UIViewController {

   
    private lazy var collapse  : PlutoView = {
        let l = PlutoView(maxHeightType: .fixed(float: 250) )
        l.delegate = self
        l.registerTabs(tabs: [FirstTab.self  , SecondTab.self , ThirdTab.self])
        return l
    }()
    
    private let headerView : HeaderView = {
        let l = HeaderView()

        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = collapse
        collapse.addHeader(header: headerView )
        headerView.completion = { [weak self] index in
            self?.collapse.scrollToTab(index: index)
        }
    }
    
    func hideViews (height : CGFloat) {
        var fraction : CGFloat = 0.0
        if height == 250 {
            fraction = 1
        }else if height == 50 + UIApplication.shared.statusBarFrame.height {
            fraction = 0
        }else {
            fraction =  ( height / 250 )
        }
        headerView.stackImage.alpha = fraction
        
    }
}

extension ViewController : PlutoDelegate {
    
    func getPageIndex(page: Int) {
        switch page {
        case 0:
            headerView.l1.textColor = .black
            headerView.l2.textColor = .white
            headerView.l3.textColor = .white
            break
        case 1 :
            headerView.l2.textColor = .black
            headerView.l1.textColor = .white
            headerView.l3.textColor = .white
            break
        case 2 :
            headerView.l3.textColor = .black
            headerView.l2.textColor = .white
            headerView.l1.textColor = .white
            break
        default:
            break
        }
    }
    
    func didScrollView(_ scrollView: UIScrollView) {
        hideViews(height: headerView.frame.height)
    }
    
    func getCountTabs() -> Int {
        return 3
    }
    
    func tabForIndex(index: Int) -> TabCell? {
        if index == 0 {
            getPageIndex(page: 0)
            let cell = collapse.initTab(type: FirstTab.self, index: index ) as! FirstTab
            
            return cell
        }else if index == 1 {
            let cell = collapse.initTab(type: SecondTab.self , index: index ) as! SecondTab
            
            return cell
        }else if index == 2 {
            let cell = collapse.initTab(type: ThirdTab.self , index: index ) as! ThirdTab
            
            return cell
        }
        return nil
    }
}


