//
//  GradientButton.swift
//  JPGradient
//
//  Created by 周健平 on 2020/9/17.
//  Copyright © 2020 周健平. All rights reserved.
//

import UIKit

public class GradientButton: UIButton {
    // MARK: - 私有成员
    fileprivate lazy var gLabel: GradientLabel = GradientLabel()
    
    // MARK: - 重写的父类函数
    
    // MARK: - 重写的父类函数
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect = .zero,
                            startPoint: CGPoint = .zero,
                            endPoint: CGPoint = .zero,
                            locations: [NSNumber]? = nil,
                            colors: [UIColor]? = nil,
                            text: String? = nil,
                            font: UIFont? = nil) {
        self.init(frame: frame)
        
        gLabel.startPoint(startPoint)
             .endPoint(endPoint)
             .locations(locations)
             .colors(colors)
        
        setText(text, font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        gLabel.setText(title)
        super.setTitle(title, for: .normal)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = self.titleLabel else { return }
        gLabel.frame = titleLabel.bounds
        
        if titleLabel.subviews.contains(gLabel) == false {
            titleLabel.addSubview(gLabel)
        }
    }
}

// MARK: - JPGradient
extension GradientButton: JPGradient {
    public var gLayer: CAGradientLayer {
        get { gLabel.gLayer }
    }
}

// MARK: - 对外函数
public extension GradientButton {
    @discardableResult
    func setText(_ text: String?, font: UIFont? = nil) -> GradientButton {
        gLabel.setText(text, font: font)
        titleLabel?.font = font
        super.setTitle(text, for: .normal)
        super.setTitleColor(.clear, for: .normal)
        setNeedsLayout()
        return self
    }
}
