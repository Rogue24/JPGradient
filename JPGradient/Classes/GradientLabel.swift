//
//  GradientLabel.swift
//  JPGradient
//
//  Created by 周健平 on 2020/9/17.
//  Copyright © 2020 周健平. All rights reserved.
//

import UIKit

public class GradientLabel: UIView {
    // MARK: - 私有成员
    fileprivate let gView: GradientView = {
        let gView = GradientView()
        gView.isUserInteractionEnabled = false
        return gView
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    // MARK: - 构造函数
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        gView.addSubview(label)
        gView.mask = label
        addSubview(gView)
    }
    
    public convenience init(frame: CGRect = .zero,
                            startPoint: CGPoint = .zero,
                            endPoint: CGPoint = .zero,
                            locations: [NSNumber]? = nil,
                            colors: [UIColor]? = nil,
                            text: String? = nil,
                            font: UIFont? = nil) {
        self.init(frame: frame)
        
        gView.startPoint(startPoint)
             .endPoint(endPoint)
             .locations(locations)
             .colors(colors)
        
        setText(text, font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 重写的父类函数
    public override func layoutSubviews() {
        super.layoutSubviews()
        gView.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}

// MARK: - JPGradient
extension GradientLabel: JPGradient {
    public var gLayer: CAGradientLayer {
        get { gView.gLayer }
    }
}

// MARK: - 对外函数
public extension GradientLabel {
    @discardableResult
    func setText(_ text: String? = nil, font: UIFont? = nil) -> GradientLabel {
        label.text = text
        if let font = font { label.font = font }
        __updateContentLayout()
        return self
    }
    
    var text: String? {
        set { setText(newValue) }
        get { label.text }
    }
    
    var font: UIFont {
        set { setText(label.text, font: newValue) }
        get { label.font }
    }
}

// MARK: - 私有函数
extension GradientLabel {
    fileprivate func __updateContentLayout() {
        label.sizeToFit()
        let width = label.frame.width
        let height = label.frame.height
        gView.frame = CGRect(x: (bounds.width - width) * 0.5,
                             y: (bounds.height - height) * 0.5,
                             width: width,
                             height: height)
    }
}
