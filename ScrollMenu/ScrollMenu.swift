//
//  ScrollMenu.swift
//  ScrollMenu
//
//  Created by hf on 2016/07/30.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit

/**
 ScrollMenu class delegate
 */
public protocol ScrollMenuDelegate{
    /**
     execute when select menu.
     - parameters: index : selected menu's index
    */
    func scrollMenuDidSelect(index index: Int)
    
    /**
     execute when select menu.
     - parameters: index : selected menu's index
     */
    func scrollMenuDidDeselect(index index: Int)
}

/**
 Scroll Menu
 */
public class ScrollMenu: UIScrollView {
    /// ScrollMenuDelegate class instance
    var scrollMenuDelegate: ScrollMenuDelegate?
    
    // private property
    private let selectedY: CGFloat = 0
    private var _deselectedTopMargin: CGFloat = 10
    private var _menuWidth: CGFloat = 120
    private var selectedMenu: MenuView?
    private var menus = [MenuView]()
    
    /**
     menu width. default is 120pt
     when set other pt, must be more than 0
    */
    var menuWidth: CGFloat{
        set(newValue){
            if newValue < 0{
                _menuWidth = 0
            }else{
                _menuWidth = newValue
            }
        }
        get{
            return _menuWidth
        }
    }
    
    /**
     difference between selected menu's top position and deselected menu's top position.
     default is 10pt. when set other pt, must be more than 0.
    */
    var deselectedTopMargin: CGFloat{
        set(newValue){
            if newValue < 0{
                _deselectedTopMargin = 0
            }else{
                _deselectedTopMargin = newValue
            }
            menus.forEach{
                menu in
                menu.setDeselectedMargin(_deselectedTopMargin)
            }
        }
        get{
            return _deselectedTopMargin
        }
    }
    
    /**
     add menu
     - parameters: menu : Menu class instance
     */
    func addMenu(menu: Menu){
        let menuView = MenuView(frame: CGRectZero)
        menuView.setMenu(menu)
        menuView.setDeselectedMargin(deselectedTopMargin)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ScrollMenu.selectMenu))
        menuView.addGestureRecognizer(tap)
        menus.append(menuView)
    }
    
    /**
     when select menu, execute
     - parameters: sender : must be UITapgesture class instance
    */
    func selectMenu(sender: AnyObject){
        guard
            let gesture = sender as? UITapGestureRecognizer,
            let menu = gesture.view as? MenuView
        else{
            return
        }
        
        // select menu
        let selectedIndex = menus.indexOf(menu)!
        selectIndex(selectedIndex)
    }
    
    // MARK: private methods
    /**
     setting this class
     */
    private func updateView(){
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    /**
     change the menu into deselected state
     */
    private func deselectIndex(index: Int){
        guard index >= 0 && index < menus.count else{
            return
        }
        let menu = menus[index]
        
        selectedMenu = nil
        
        UIView.animateWithDuration(0.3){
            menu.deselect()
            menu.frame = CGRect(x: menu.frame.origin.x, y: self.deselectedTopMargin, width: menu.bounds.width, height: menu.bounds.height)
        }
    }
    
    /**
     change the menu into selected state
     */
    func selectIndex(index: Int){
        guard index >= 0 && index < menus.count else{
            return
        }
        
        // deselect menu
        if let deselectedMenu = selectedMenu{
            let deselectedIndex = menus.indexOf(deselectedMenu)!
            deselectIndex(deselectedIndex)
            scrollMenuDelegate?.scrollMenuDidDeselect(index: deselectedIndex)
        }
        
        let menu = menus[index]
        selectedMenu = menu
        scrollMenuDelegate?.scrollMenuDidSelect(index: index)
        
        let contentSizeW = contentSize.width
        let selectedCenterX = CGRectGetMidX(menu.frame)
        let halfWidth = bounds.width / 2
        
        let isLeftOverMiddle = (contentSizeW - selectedCenterX) - halfWidth >= 0
        let leftSpace = selectedCenterX - halfWidth
        let isSufficeLeftSpace = leftSpace > 0
        
        UIView.animateWithDuration(0.3){
            menu.select()
            
            if isLeftOverMiddle{
                let positionX = isSufficeLeftSpace ? leftSpace : 0
                self.contentOffset = CGPoint(x: positionX, y: self.bounds.origin.y)
            }else{
                self.contentOffset = CGPoint(x: contentSizeW % self.bounds.width, y: self.bounds.origin.y)
            }
            menu.frame = CGRect(x: menu.frame.origin.x, y: 0, width: menu.bounds.width, height: menu.bounds.height)
        }
    }
    
    // MARK: Superclass Method override
    public override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        updateView()
        
        for(index, menu) in menus.enumerate(){
            menu.frame = CGRect(x: 0 + CGFloat(index) * menuWidth, y: deselectedTopMargin, width: menuWidth, height: bounds.height)
            addSubview(menu)
        }
        contentSize = CGSize(width: menuWidth * CGFloat(menus.count), height: bounds.height)
    }
}
