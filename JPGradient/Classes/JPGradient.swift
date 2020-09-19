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
        set { gLayer.startPoint = newValue }
        get { gLayer.startPoint }
    }
    
    @discardableResult
    func endPoint(_ ep: CGPoint) -> Self {
        gLayer.endPoint = ep
        return self
    }
    var endPoint: CGPoint {
        set { gLayer.endPoint = newValue }
        get { gLayer.endPoint }
    }

    @discardableResult
    func locations(_ ls: [NSNumber]?) -> Self {
        gLayer.locations = ls
        return self
    }
    var locations: [NSNumber]? {
        set { gLayer.locations = newValue }
        get { gLayer.locations }
    }
    
    @discardableResult
    func colors(_ uiColors: [UIColor]?) -> Self {
        gLayer.colors = Self.uiColors2cgColors(uiColors)
        return self
    }
    var colors: [UIColor]? {
        set { gLayer.colors = Self.uiColors2cgColors(newValue) }
        get { gLayer.colors?.map { UIColor(cgColor: $0 as! CGColor) } }
    }
    
    private static func uiColors2cgColors(_ uiColors: [UIColor]?) -> [Any]? {
        guard let colors = uiColors else { return nil }
        if colors.count == 1 {
            let cgColor = colors.first!.cgColor
            return [cgColor, cgColor]
        }
        return colors.map { $0.cgColor }
    }
}
