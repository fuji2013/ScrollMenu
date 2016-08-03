# ScrollMenu
Horizontally scroll menu.
You can save effort to make scrolling menu.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

![Demo](https://cloud.githubusercontent.com/assets/4578511/17367235/25c7e36e-59ca-11e6-988d-765819c878aa.gif)

## Runtime Requirements

- iOS8.0 or later
- Xcode 7.3.1 - Swift2.2

## Installation and Setup
### Installing with Carthage

Just add to your Cartfile:

```ogdl
github "fuji2013/ScrollMenu"
```

### Manual Installation

To install FJSAlertController without a dependency manager, please add files to your Xcode Project.
- Menu.swift
- MenuView.swift
- ScrollMenu.swift

## How to use

Create `FJSImageViewController` instance where you want.

```Swift
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

// add menu to scrollMenu
scrollMenu?.addMenu(menu1)
scrollMenu?.addMenu(menu2)
scrollMenu?.addMenu(menu3)
scrollMenu?.selectIndex(0)

// add scrollMenu to view
view.addSubview(scrollMenu!)
```

## Contribution

Please file issues or submit pull requests for anything you’d like to see! We're waiting! :)

## License
ScrollMenu is released under the MIT license. Go read the LICENSE file for more information.
