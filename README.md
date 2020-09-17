# JPGradient

## 简介

一些可将背景或文字设置成渐变色的控件，包括 UIView、UILabel、UIButton。

## 使用

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    let gLabel = GradientLabel(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
                .text("爽歪歪", font: .boldSystemFont(ofSize: 70))
                .textColors([.systemYellow, .systemPurple, .systemTeal])
    gLabel.backgroundColor = .black
    view.addSubview(gLabel)
    
    let gBtn = GradientButton(type: .system)
                .text("哈哈哈", font: .boldSystemFont(ofSize: 70), textColors: [.blue, .yellow, .red])
    gBtn.frame = CGRect(x: 50, y: 250, width: 300, height: 100)
    gBtn.backgroundColor = .green
    gBtn.setImage(UIImage(named: "denim_jacket")?.withRenderingMode(.alwaysOriginal), for: .normal)
    gBtn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
    view.addSubview(gBtn)
}
```
![effect](https://github.com/Rogue24/JPGradient/raw/master/effect.jpg)

## 简单实现

使用了`CAGradientLayer`，再使用`UILabel`作为图层的`mask`，这样只要设置`CAGradientLayer`的`colors`属性即可实现动态修改文字的渐变背景色，也可单色。

** 为什么不绘制渐变色图片，再通过 UIColor.init(patternImage: image) 去获取渐变色？**
这的确是一个更加优雅的实现方案，不过最近发现旧版本（iOS13以下）的系统，如果使用了第三方键盘（如搜狗），只要调用过该函数就会崩溃，目前还不清楚具体原因，只好使用该方案以兼容旧版本。
