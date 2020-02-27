# LCXReuseViewID

[![CI Status](https://img.shields.io/travis/475512103@qq.com/LCXReuseViewID.svg?style=flat)](https://travis-ci.org/475512103@qq.com/LCXReuseViewID)
[![Version](https://img.shields.io/cocoapods/v/LCXReuseViewID.svg?style=flat)](https://cocoapods.org/pods/LCXReuseViewID)
[![License](https://img.shields.io/cocoapods/l/LCXReuseViewID.svg?style=flat)](https://cocoapods.org/pods/LCXReuseViewID)
[![Platform](https://img.shields.io/cocoapods/p/LCXReuseViewID.svg?style=flat)](https://cocoapods.org/pods/LCXReuseViewID)

## 作用：注册复用view的超级简便使用；

## 支持：UITableViewCell、UITableViewHeaderFooterView；UICollectionViewCell、UICollectionReusableView；
 
 ## 思路：
 1 以复用View的类名作为复用id；
 2 通过runtime给分类添加属性；
 
 ## 优点：
 以UITableViewCell子类的注册复用为例：
 1 免import使用cell的头文件；
 2 免命名reuseID；
 3 免重复register复用cell类（特别cell种类多时，代码简化作用明显）；
 4 防止reuseID在register时和在tableview delegate中使用时，不一致错误；
 5 打印提示：未注册成功的类名字符串；
 
 ## 注册复用cell代码
_tableView.lcx_registerCellClassNames = @[@"ATableViewCell",@"BTableViewCell"];
_tableView.lcx_registerHeaderFooterClassNames = @[@"AHeaderFooterView",@"BHeaderFooterView"];

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LCXReuseViewID is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LCXReuseViewID'
```

## Author

475512103@qq.com, leichunxiang58@163.com

## License

LCXReuseViewID is available under the MIT license. See the LICENSE file for more info.
