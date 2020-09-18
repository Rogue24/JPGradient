//
//  GradientLabel.swift
//  JPGradientLabel
//
//  Created by 周健平 on 2020/9/17.
//  Copyright © 2020 周健平. All rights reserved.
//

import UIKit

public class GradientLabel: UIView {
    // MARK: - 成员
    public let textBgView: GradientView = {
        let tbView = GradientView()
            .startPoint(.init(x: 0, y: 0.5))
            .endPoint(.init(x: 1, y: 0.5))
        tbView.isUserInteractionEnabled = false
        return tbView
    }()
    
    public let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    // MARK: - 重写的父类函数
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        
        textBgView.addSubview(textLabel)
        textBgView.mask = textLabel
        addSubview(textBgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        textBgView.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}

// MARK: - 对外函数
public extension GradientLabel {
    @discardableResult
    func text(_ text: String?, font: UIFont? = nil) -> GradientLabel {
        textLabel.text = text
        if let font = font { textLabel.font = font }
        __updateContentLayout()
        return self
    }
    var text: String? {
        get { textLabel.text }
    }
    var font: UIFont {
        get { textLabel.font }
    }
    
    @discardableResult
    func textStartPoint(_ sp: CGPoint) -> GradientLabel {
        _ = textBgView.startPoint(sp)
        return self
    }
    var textStartPoint: CGPoint {
        get { textBgView.startPoint }
    }
    
    @discardableResult
    func textEndPoint(_ ep: CGPoint) -> GradientLabel {
        _ = textBgView.endPoint(ep)
        return self
    }
    var textEndPoint: CGPoint {
        get { textBgView.endPoint }
    }

    @discardableResult
    func textLocations(_ ls: [NSNumber]?) -> GradientLabel {
        _ = textBgView.locations(ls)
        return self
    }
    var textLocations: [NSNumber]? {
        get { textBgView.locations }
    }
    
    @discardableResult
    func textColors(_ cs: [UIColor]?) -> GradientLabel {
        _ = textBgView.colors(cs)
        return self
    }
    var textColors: [UIColor]? {
        get { textBgView.colors }
    }
}

// MARK: - 私有函数
extension GradientLabel {
    fileprivate func __updateContentLayout() {
        textLabel.sizeToFit()
        let width = textLabel.frame.width
        let height = textLabel.frame.height
        textBgView.frame = CGRect(x: (bounds.width - width) * 0.5,
                                  y: (bounds.height - height) * 0.5,
                                  width: width,
                                  height: height)
    }
}
