//
//  MPProgressDialog.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 7. 5..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit

//Dialog Type
public enum MPProgressDialogType {
    case linear
    case circular
    case semicircle
}


class MPProgressDialog : UIView {
    var progressBar: UIProgressView!
    
    var _progressCount: UILabel? = nil
    open var progressLabel: UILabel? {
        get {
            if(progressType == .linear) {
                if _progressCount == nil {
                    _progressCount = UILabel(frame: CGRect(x: self.frame.maxX - UIScreen.main.bounds.width/8, y: progressBar.frame.midY, width: UIScreen.main.bounds.width/8, height: 30))
                    _progressCount?.center.y = progressBar.center.y
                    addSubview(_progressCount!)
                }
                return _progressCount!
            } else if(progressType == .circular) {
                if _progressCount == nil {
                    _progressCount = UILabel(frame: CGRect(x: self.frame.maxX - UIScreen.main.bounds.width/8, y: circle.frame.midY, width: UIScreen.main.bounds.width/8, height: 30))
                    _progressCount?.center = circle.center
                    addSubview(_progressCount!)
                }
                return _progressCount
            } else {
                return _progressCount
            }
        }
    }
    
    // cancle button
//    open var cancleBtn: UIButton{
//        get {
//            let tempBtn = UIButton(frame: CGRect(x: progressBar.frame.minX, y: 0, width: UIScreen.main.bounds.width/8,
//                                                 height: UIScreen.main.bounds.width/24))
//            tempBtn.backgroundColor = .red
//            return tempBtn
//        }
//    }
    
    open var cancelBtn: UIButton!
    
    //progressType. default linear.
    open var progressType: MPProgressDialogType?
    
    open var buttonAction: DialogButtonAction?
    
    open var progressTitle: String? = nil {
        didSet {
            progressLabel?.text = progressTitle!
            progressLabel?.font = UIFont.systemFont(ofSize: 10)
            progressLabel?.textAlignment = .center
        }
    }
    
    open var counter: Int = 0 {
        didSet {
            let fractionalProgress = Float(counter)/100.0
            let animated = counter != 0
            
            if(progressType == .linear) {
                progressBar.setProgress(fractionalProgress, animated: animated)
                _progressCount?.text = "\(counter)%"
                _progressCount?.textAlignment = .center
                if(_progressCount?.text == "100%") {
                    handler?(self)
                }
            } else if(progressType == .circular) {
                _progressCount?.text = "\(counter)%"
                _progressCount?.textAlignment = .center
                if(_progressCount?.text == "100%") {
                    handler?(self)
                }
            }
        }
    }
    
    open var circle : UIView!
    open var progressCircle : CAShapeLayer!
    
    open var circlePath : UIBezierPath!
    
    open var animation : CABasicAnimation!
    
    //Default Start Value
    open var startValue = 0
    
    //Default End Value
    open var endValue = 1
    
    //Handler is excuted when progress is 100%.
    open var handler: ((MPProgressDialog) -> Void)? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(frame: CGRect, type: MPProgressDialogType?) {
        super.init(frame: frame)
        self.backgroundColor = .white
        var dialogType: MPProgressDialogType?
        if(type == nil) {
            dialogType = .linear
        } else {
            dialogType = type
        }
        switch dialogType! {
        case .linear:
            progressBar = UIProgressView(frame: CGRect(x: 0, y: (frame.maxY)/3 + (frame.minY)*2/3, width: frame.width*7/9, height: (1)))
            progressBar.transform = progressBar.transform.scaledBy(x: 1, y: frame.height/20)
            progressBar.progress = 0.0
            addSubview(progressBar)
            if(_progressCount != nil) {
                _progressCount?.center.y = progressBar.frame.origin.y
                bringSubview(toFront: _progressCount!)
            }
        case .circular:
            circle = UIView(frame: CGRect(x: self.center.x - 40, y: self.center.y - 60, width: 80, height: 80))
            circle.backgroundColor = .white
            circle.layer.cornerRadius = circle.frame.size.width/2
            circle.clipsToBounds = true
            
            addSubview(circle)
            
            progressCircle = CAShapeLayer()
            
            circlePath = UIBezierPath(ovalIn: circle.bounds)
            progressCircle = CAShapeLayer ()
            progressCircle.path = circlePath.cgPath
            progressCircle.strokeColor = UIColor.green.cgColor
            progressCircle.fillColor = UIColor.clear.cgColor
            progressCircle.lineWidth = 5.0
            progressCircle.strokeEnd = 0
            
            circle.layer.addSublayer(progressCircle)
                        
            if(_progressCount != nil) {
                _progressCount?.center = circle.center
                bringSubview(toFront: _progressCount!)
            }
            
            
            
            print("circular!")
        case .semicircle:
            print("semicircle")
        }
        cancelBtn = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 40, width: UIScreen.main.bounds.width/8, height: UIScreen.main.bounds.width/16))
        cancelBtn.center.x = self.center.x
        cancelBtn.setTitle("cancel", for: .normal)
        cancelBtn.backgroundColor = .red
        cancelBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        
        addSubview(cancelBtn)
    }
    
    //default init - linear
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        //default linear.
        progressType = .linear
        progressBar = UIProgressView(frame: CGRect(x: 0, y: (frame.maxY)/3 + (frame.minY)*2/3, width: frame.width*7/9, height: (1)))
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: frame.height/20)
        progressBar.progress = 0.0
        addSubview(progressBar)
        if(_progressCount != nil) {
            _progressCount?.center.y = progressBar.frame.origin.y
            bringSubview(toFront: _progressCount!)
        }
        
        cancelBtn = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 40, width: UIScreen.main.bounds.width/8, height: UIScreen.main.bounds.width/16))
        cancelBtn.center.x = self.center.x
        cancelBtn.setTitle("cancel", for: .normal)
        cancelBtn.backgroundColor = .red
        cancelBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    
        addSubview(cancelBtn)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    open func startProgress() {
        switch progressType! {
        case .linear:
            DispatchQueue.global().async {
                for _ in 0..<100 {
                    usleep(10000)
                    DispatchQueue.main.async {
                        self.counter += 1
                        return
                    }
                }
            }

            print("linearrrrr")
        case .circular:
            DispatchQueue.global().async {
            for i in 0..<100 {
                usleep(100000)
                let anime = CABasicAnimation(keyPath: "strokeEnd")
                print("\(i)/100 \(Float(i)/Float(100))")
                print("\((i+1))/100 \(Float((i+1))/Float(100))")
                anime.fromValue = Float(i)/Float(100)
                anime.toValue = Float((i+1))/Float(100)
                anime.duration = 0.8
                anime.isRemovedOnCompletion = false
                anime.fillMode = kCAFillModeForwards
                DispatchQueue.main.async {
                        self.progressCircle.add(anime, forKey: "ani")
                        self.counter += 1
                        print("self.counter \(self.counter)")
                        if(self.counter == 100) {
                            print("overrrr")
                            self.progressCircle.strokeEnd = 1.0
                            self.progressCircle.removeAllAnimations()
                        }
                    }
                }
            }
            print("circulaaarrr")
        case .semicircle:
            print("semiCircular")
        }
    }
}
