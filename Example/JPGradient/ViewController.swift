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
        label.backgroundColor = .black
        return label
    }()
    
    let gBtn: GradientButton = {
        let btn = GradientButton(type: .system)
        btn.frame = CGRect(x: 50, y: 250, width: 300, height: 100)
        btn.backgroundColor = .green
        btn.setImage(UIImage(named: "denim_jacket")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = gLabel.text("爽歪歪", font: .boldSystemFont(ofSize: 70))
            .textColors([.systemYellow, .systemPurple, .systemTeal])
        view.addSubview(gLabel)
        
        _ = gBtn.text("哈哈哈", font: .boldSystemFont(ofSize: 70), textColors: [.blue, .yellow, .red])
        view.addSubview(gBtn)
    }
    
    @objc func tapBtn() {
        print("why to tap me")
    }
}

