//
//  ViewController.swift
//  Demo
//
//  Created by hf on 2016/08/03.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScrollMenuDelegate {
    var scrollMenu: ScrollMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup ScrollMenu
        scrollMenu = ScrollMenu(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 50))
        scrollMenu?.scrollMenuDelegate = self
        
        // prepare menu
        let menu1 = Menu(title: "Menu1",
                        defaultBarColor: UIColor.redColor(),
                        selectedBarColor: UIColor.redColor(),
                        selectedTitleColor: UIColor.redColor())
        
        let menu2 = Menu(title: "Menu2",
                        defaultBarColor: UIColor.greenColor(),
                        selectedBarColor: UIColor.greenColor(),
                        selectedTitleColor: UIColor.greenColor())
        
        let menu3 = Menu(title: "Menu3",
                         defaultBarColor: UIColor.blueColor(),
                         selectedBarColor: UIColor.blueColor(),
                         selectedTitleColor: UIColor.blueColor())
        
        let menu4 = Menu(title: "Menu4",
                         defaultBarColor: UIColor.blackColor(),
                         selectedBarColor: UIColor.blackColor(),
                         selectedTitleColor: UIColor.blackColor())
        
        let menu5 = Menu(title: "Menu5",
                         defaultBarColor: UIColor.brownColor(),
                         selectedBarColor: UIColor.brownColor(),
                         selectedTitleColor: UIColor.brownColor())
        
        let menu6 = Menu(title: "Menu6",
                         defaultBarColor: UIColor.purpleColor(),
                         selectedBarColor: UIColor.purpleColor(),
                         selectedTitleColor: UIColor.purpleColor())
        
        // add menu to scrollMenu
        scrollMenu?.addMenu(menu1)
        scrollMenu?.addMenu(menu2)
        scrollMenu?.addMenu(menu3)
        scrollMenu?.addMenu(menu4)
        scrollMenu?.addMenu(menu5)
        scrollMenu?.addMenu(menu6)
        scrollMenu?.selectIndex(0)
        
        // add scrollMenu to view
        view.addSubview(scrollMenu!)
    }
    
    // execute when menu select
    func scrollMenuDidSelect(index index: Int) {
        print("selected: \(index)")
    }
    
    // execute when menu is deselected state
    func scrollMenuDidDeselect(index index: Int) {
        print("deselected: \(index)")
    }
}
