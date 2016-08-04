//
//  MenuView.swift
//  ScrollMenu
//
//  Created by hf on 2016/07/30.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit

public class MenuView: UIView {
    public var title: String = ""{
        didSet(newValue){
            titleLabel.text = newValue
        }
    }
    public var defaultBarColor = UIColor.grayColor()
    public var selectedBarColor = UIColor.blackColor()
    public var defaultTitleColor = UIColor.grayColor()
    public var selectedTitleColor = UIColor.blackColor()
    public var defaultBGColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    public var selectedBGColor = UIColor.whiteColor()
    
    private var deselectedMargin: CGFloat = 10
    private let margin: CGFloat = 3
    private let topLineView = UIView(frame: CGRectZero)
    private let titleLabel = UILabel(frame: CGRectZero)
    
    /**
     difference between selected menu's top position and deselected menu's top position.
     default is 10pt. when set other pt, must be more than 0.
     */
    internal func setDeselectedMargin(margin:CGFloat){
        self.deselectedMargin = margin
    }
    
    /**
     set property
    */
    internal func setMenu(menu: Menu){
        self.title = menu.title
        self.defaultBarColor = menu.defaultBarColor
        self.selectedBarColor = menu.selectedBarColor
        self.defaultTitleColor = menu.defaultTitleColor
        self.selectedTitleColor = menu.selectedTitleColor
        self.defaultBGColor = menu.defaultBGColor
        self.selectedBGColor = menu.selectedBGColor
    }
    
    /**
     execute when select
    */
    internal func select(){
        topLineView.backgroundColor = selectedBarColor
        titleLabel.textColor = selectedTitleColor
        backgroundColor = selectedBGColor
    }
    
    /**
     execute when deselect
     */
    
    internal func deselect(){
        topLineView.backgroundColor = defaultBarColor
        titleLabel.textColor = defaultTitleColor
        backgroundColor = defaultBGColor
    }
    
    private func updateViews(){
        backgroundColor = defaultBGColor
        
        // setting topLineView
        let topLineViewRect =
            CGRect(x: margin, y: margin, width: bounds.width - (margin * 2), height: (bounds.height - (margin * 2)) / 8)
        topLineView.frame = topLineViewRect
        topLineView.backgroundColor = defaultBarColor
        
        // setting titleLabel
        titleLabel.textColor = defaultTitleColor
        titleLabel.text = title
        
        titleLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.lineBreakMode = .ByTruncatingTail
        titleLabel.sizeToFit()
        
        let topLineViewBottom = topLineViewRect.origin.y + topLineViewRect.size.height
        let underTopLineViewSpace = bounds.height - topLineViewBottom - deselectedMargin
        let centerPosition = CGPoint(x: bounds.width / 2 , y: topLineViewBottom + underTopLineViewSpace / 2)
        titleLabel.center = centerPosition
        
        addSubview(topLineView)
        addSubview(titleLabel)
    }
    
    override public func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        updateViews()
    }
}
