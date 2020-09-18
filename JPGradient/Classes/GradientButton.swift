//
//  GradientButton.swift
//  JPGradientLabel
//
//  Created by 周健平 on 2020/9/17.
//  Copyright © 2020 周健平. All rights reserved.
//

import UIKit

public class GradientButton: UIButton {
    // MARK: - 成员
    public lazy var gLabel: GradientLabel = {
        let gLabel = GradientLabel()
        gLabel.isUserInteractionEnabled = false
        return gLabel
    }()
    
    // MARK: - 重写的父类函数
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        gLabel.text(title)
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

// MARK: - 对外函数
public extension GradientButton {
    @discardableResult
    func text(_ text: String?, font: UIFont? = nil, textColors: [UIColor]? = nil) -> GradientButton {
        titleLabel?.font = font
        super.setTitle(text, for: .normal)
        super.setTitleColor(.clear, for: .normal)
        gLabel.text(text, font: font).textColors(textColors)
        return self
    }
}
