//
//  GradientView.swift
//  JPGradient
//
//  Created by 周健平 on 2020/9/17.
//  Copyright © 2020 周健平. All rights reserved.
//

import UIKit

public class GradientView: UIView {
    // MARK: - 重写的父类函数
    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    // MARK: - 构造函数
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect = .zero,
                            startPoint: CGPoint = .zero,
                            endPoint: CGPoint = .zero,
                            locations: [NSNumber]? = nil,
                            colors: [UIColor]? = nil) {
        self.init(frame: frame)
        
        self.startPoint(startPoint)
            .endPoint(endPoint)
            .locations(locations)
            .colors(colors)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - JPGradient
extension GradientView: JPGradient {
    public var gLayer: CAGradientLayer { layer as! CAGradientLayer }
}
