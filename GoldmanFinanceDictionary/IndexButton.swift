//
//  IndexButton.swift
//  GoldmanFinanceDictionary
//
//  Created by owen on 17/6/21.
//  Copyright © 2017年 libowen. All rights reserved.
//
/**
 自定义UIButton
 
 */

import UIKit

class IndexButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    var scale: Float = 0.0 {
        didSet {
            // 设置颜色
            if scale == 1 {
                self.setTitleColor(UIColor.init(colorLiteralRed: scale, green: 0.0, blue: 0.0, alpha: 1.0), for: .normal) // 红色
            } else {
                self.setTitleColor(UIColor.init(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)       // 白色
            }
            // 设置变换
            let minScale: CGFloat = 0.7
            let trueScale: CGFloat = minScale + (1-minScale) * CGFloat(scale)
            self.transform = CGAffineTransform(scaleX: trueScale, y: trueScale)
        }
    }
    
    func setUp() {
        self.scale = 0.0
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
