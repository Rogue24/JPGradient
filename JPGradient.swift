//
//  JPGradient.swift
//  JPGradient
//
//  Created by 周健平 on 2020/9/18.
//

import UIKit

public protocol JPGradient: UIView {
    var gLayer: CAGradientLayer { get }
}

public extension JPGradient {
    @discardableResult
    func startPoint(_ sp: CGPoint) -> Self {
        gLayer.startPoint = sp
        return self
    }
    var startPoint: CGPoint {
        get { gLayer.startPoint }
    }
    
    @discardableResult
    func endPoint(_ ep: CGPoint) -> Self {
        gLayer.endPoint = ep
        return self
    }
    var endPoint: CGPoint {
        get { gLayer.endPoint }
    }

    @discardableResult
    func locations(_ ls: [NSNumber]?) -> Self {
        gLayer.locations = ls
        return self
    }
    var locations: [NSNumber]? {
        get { gLayer.locations }
    }
    
    @discardableResult
    func colors(_ uiColors: [UIColor]?) -> Self {
        guard let colors = uiColors else {
            gLayer.colors = nil
            return self
        }
        if colors.count == 1 {
            let cgColor = colors.first!.cgColor
            gLayer.colors = [cgColor, cgColor]
        } else {
            gLayer.colors = colors.map { $0.cgColor }
        }
        return self
    }
    var colors: [UIColor]? {
        get { gLayer.colors?.map { UIColor(cgColor: $0 as! CGColor) } }
    }
}
