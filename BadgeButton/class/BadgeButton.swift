//
//  BadgeButton.swift
//
//
//  Created by liurenchi on 3/26/18.
//  Copyright © 2018 lrc. All rights reserved.
//This  repository link: https://github.com/RENCHILIU/BadgeButton
//My personal website : https://renchiliu.github.io/

import UIKit

@IBDesignable class BadgeButton: UIButton {
    private var badgeView = UIView()
    private var badgeLabel = UILabel()
    private var badgeViewWideRate : CGFloat = 1.0
    private var radiusRate : CGFloat = 2.0
    private var badgeHidden : Bool!
    
    
    
    @IBInspectable public var badgeNumber : Int = 0{
        didSet {
            if badgeNumber <= 0 {
                if badgeNumber < 0{
                    badgeViewWideRate = 2.0
                    radiusRate = 4.2
                }else{ // == 0
                    badgeViewWideRate = 1
                    radiusRate = 2
                }
                if(hiddenWhenZero){
                    badgeHidden = true
                }else{
                    badgeHidden = false
                }
            }else{
                badgeViewWideRate = 1
                radiusRate = 2
                badgeHidden = false
            }
            if(badgeNumber > 9){
                badgeViewWideRate = 1.5
                radiusRate = 3.2
            }
            if(badgeNumber > 99){
                badgeViewWideRate = 2.0
                radiusRate = 4.2
            }
            self.setNeedsDisplay() // call draw()
            
        }
    }
    
    @IBInspectable public var hiddenWhenZero : Bool = true{
        didSet {
            if hiddenWhenZero {
                if badgeNumber <= 0 {
                    badgeHidden = true
                }else{
                    badgeHidden = false
                }
            }else{
                badgeHidden = false
            }
        }
    }
    @IBInspectable public var badgeColor : UIColor = .red
    @IBInspectable public var badgeNumberColor : UIColor = .white
    @IBInspectable public var circleView : Bool = false
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        if circleView {
            self.imageView?.layer.cornerRadius = rect.width / 2
            self.imageView?.layer.masksToBounds = true
        }
        
        
        if !badgeHidden{
            // Drawing code
            // Badge View
            badgeView.frame = CGRect(x: rect.maxX * 3 / 4 + 1, y: rect.minY - 3, width: rect.maxX / 3 * badgeViewWideRate, height: rect.maxX / 3)
            badgeView.backgroundColor = badgeColor
            badgeView.layer.cornerRadius = badgeView.frame.width / radiusRate
            badgeView.layer.masksToBounds = true
            
            
            // Badge Number
            badgeLabel.frame = badgeView.bounds
            badgeLabel.textColor = badgeNumberColor
            badgeLabel.text = "\(badgeNumber)"
            badgeLabel.textAlignment = .center
            
            if rect.width <= CGFloat(30) {
                badgeLabel.font = UIFont.systemFont(ofSize: 5)
            }
            
            
            badgeView.addSubview(badgeLabel)
            self.addSubview(badgeView)
            
        }else{
            badgeView.removeFromSuperview()
        }
    }
    
}

