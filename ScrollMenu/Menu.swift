//
//  Menu.swift
//  ScrollMenu
//
//  Created by hf on 2016/07/30.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit

public struct SelectedColor{
    public let defaultColor: UIColor
    public let selectedColor: UIColor
}

/**
 Menu
 */
public class Menu{
    let title: String
    let defaultBarColor: UIColor
    let selectedBarColor: UIColor
    let defaultTitleColor: UIColor
    let selectedTitleColor: UIColor
    let defaultBGColor: UIColor
    let selectedBGColor: UIColor
    
    /**
     initializer
     - parameters: title: menu title
     - parameters: color: menu color
    */
    public init(title: String,
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
