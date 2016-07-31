//
//  Menu.swift
//  ScrollMenu
//
//  Created by hf on 2016/07/30.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit

/**
 Menu
 */
public class Menu{
    let title: String
    let defaultBarColor: UIColor
    var selectedBarColor: UIColor
    var defaultTitleColor: UIColor
    var selectedTitleColor: UIColor
    var defaultBGColor: UIColor
    var selectedBGColor: UIColor
    
    /**
     initializer
     - parameters: title: menu title
     - parameters: color: menu color
    */
    init(title: String,
         defaultBarColor: UIColor = UIColor.grayColor(),
         selectedBarColor: UIColor,
         defaultTitleColor: UIColor = UIColor.grayColor(),
         selectedTitleColor: UIColor,
         defaultBGColor: UIColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1),
         selectedBGColor: UIColor = UIColor.whiteColor()
         ){
        
        self.title = title
        self.defaultBarColor = defaultBarColor
        self.selectedBarColor = selectedBarColor
        self.defaultTitleColor = defaultTitleColor
        self.selectedTitleColor = selectedTitleColor
        self.defaultBGColor = defaultBGColor
        self.selectedBGColor = selectedBGColor
    }
}
