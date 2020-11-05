//
//  ViewController.swift
//  JPGradient
//
//  Created by Rogue24 on 09/17/2020.
//  Copyright (c) 2020 Rogue24. All rights reserved.
//

import UIKit
import JPGradient

class ViewController: UIViewController {
    
    let gLabel: GradientLabel = {
        let label = GradientLabel(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
        return label
    }()
    
    let gBtn: GradientButton = {
        let btn = GradientButton(type: .system)
        btn.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        btn.setImage(UIImage(named: "denim_jacket")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gLabel.setText("爽歪歪", font: .boldSystemFont(ofSize: 70))
            .startPoint(.zero)
            .endPoint(1, 1)
            .colors(.systemYellow, .systemPurple, .systemTeal)
        view.addSubview(gLabel)
        
        gBtn.setText("我是按钮", font: .boldSystemFont(ofSize: 40))
            .startPoint(0, 0.5)
            .endPoint(1, 0.5)
            .colors(.blue, .yellow, .red, .green)
        view.addSubview(gBtn)
    }
    
    @objc func tapBtn() {
        print("why tap to me")
    }
}

