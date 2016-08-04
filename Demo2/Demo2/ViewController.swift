//
//  ViewController.swift
//  Demo2
//
//  Created by hf on 2016/08/04.
//  Copyright © 2016年 swift-studying.com. All rights reserved.
//

import UIKit
import ScrollMenu

class ViewController: UIViewController, ScrollMenuDelegate {
    let images = ["001.jpg", "002.jpg", "003.jpg", "004.jpg"]
    let imageView = UIImageView(frame: CGRectZero)
    let scrollMenu = ScrollMenu(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールメニューの作成
        buildScrollMenu()
        
        // スクロールメニューの位置、サイズ
        scrollMenu.scrollMenuDelegate = self
        scrollMenu.frame = CGRect(x: 0, y: 20.0, width: view.bounds.width, height: 60)
        view.addSubview(scrollMenu)

        // 画像表示の位置、サイズ
        let center = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        let size = CGSize(width: view.bounds.width/2, height: view.bounds.height/2)
        imageView.frame = CGRect(origin: CGPointZero, size: size)
        imageView.center = center
        view.addSubview(imageView)
        
        // 最初のメニューを選択
        scrollMenu.selectIndex(0)
    }
    
    private func buildScrollMenu(){
        let colors = [UIColor.yellowColor(), UIColor.redColor(), UIColor.blueColor(), UIColor.brownColor()]
        for i in 0 ..< images.count{
            let menu = Menu(title: "image\(i)",
                            defaultBarColor: colors[i],
                            selectedBarColor: colors[i],
                            selectedTitleColor: colors[i])
            
            scrollMenu.addMenu(menu)
        }
    }

    func scrollMenuDidSelect(index index: Int) {
        // 画像の切替
        imageView.image = UIImage(named: images[index])
    }
    
    func scrollMenuDidDeselect(index index: Int) {
        // do nothing
    }
}

