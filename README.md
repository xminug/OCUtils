# MinugUtils

[![CI Status](https://img.shields.io/travis/xminug/MinugUtils.svg?style=flat)](https://travis-ci.org/xminug/MinugUtils)
[![Version](https://img.shields.io/cocoapods/v/MinugUtils.svg?style=flat)](https://cocoapods.org/pods/MinugUtils)
[![License](https://img.shields.io/cocoapods/l/MinugUtils.svg?style=flat)](https://cocoapods.org/pods/MinugUtils)
[![Platform](https://img.shields.io/cocoapods/p/MinugUtils.svg?style=flat)](https://cocoapods.org/pods/MinugUtils)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MinugUtils is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MinugUtils'
```

## Update

MinugUtils的Pod文件里面设置了根据branch拉取对应的代码，而不是根据Tag。方便以后有改动不需要重新打tag进行发布。

所以如果需要更新代码，先清除本地缓存，然后更新文件后，再次pod install，即是最新的代码了。


```
    pod cache clean MinugUtils
   #pod repo update master
    pod install
```

## Author

xminug, xminug@gmail.com

## License

MinugUtils is available under the MIT license. See the LICENSE file for more info.
