//
//  GradientView.swift
//  JPGradientLabel
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
}

// MARK: - 对外函数
public extension GradientView {
    var gLayer: CAGradientLayer {
        get { layer as! CAGradientLayer }
    }
    
    func startPoint(_ sp: CGPoint) -> Self {
        gLayer.startPoint = sp
        return self
    }
    var startPoint: CGPoint {
        get { gLayer.startPoint }
    }
    
    func endPoint(_ ep: CGPoint) -> Self {
        gLayer.endPoint = ep
        return self
    }
    var endPoint: CGPoint {
        get { gLayer.endPoint }
    }

    func locations(_ ls: [NSNumber]?) -> Self {
        gLayer.locations = ls
        return self
    }
    var locations: [NSNumber]? {
        get { gLayer.locations }
    }
    
    func colors(_ cs: [UIColor]?) -> Self {
        gLayer.colors = __colorUiToCg(cs)
        return self
    }
    var colors: [UIColor]? {
        get { __colorCgToUi(gLayer.colors) }
    }
}

// MARK: - 私有函数
extension GradientView {
    fileprivate func __colorUiToCg(_ uiColors: [UIColor]?) -> [CGColor]? {
        guard let colors = uiColors else { return nil }
        if colors.count == 1 {
            let cgColor = colors.first!.cgColor
            return [cgColor, cgColor]
        }
        return colors.map { $0.cgColor }
    }
    
    fileprivate func __colorCgToUi(_ cgColors: [Any]?) -> [UIColor]? {
        cgColors?.map { UIColor(cgColor: $0 as! CGColor) }
    }
}
