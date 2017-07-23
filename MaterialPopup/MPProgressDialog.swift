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
    open var progressLabel: UILabel {
        get {
            if _progressCount == nil {
                _progressCount = UILabel(frame: CGRect(x: progressBar.frame.maxX - UIScreen.main.bounds.width/8, y: progressBar.frame.maxY, width: UIScreen.main.bounds.width/8, height: 30))
                _progressCount?.backgroundColor = .green
                addSubview(_progressCount!)
            }
            return _progressCount!
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
    
    open var cancleBtn: UIButton!
    
    open var buttonAction: DialogButtonAction?
    
    open var progressTitle: String? = nil {
        didSet {
            progressLabel.text = progressTitle!
            progressLabel.font = UIFont.systemFont(ofSize: 10)
            progressLabel.textAlignment = .center
        }
    }
    
    open var counter: Int = 0 {
        didSet {
            let fractionalProgress = Float(counter)/100.0
            let animated = counter != 0
            
            progressBar.setProgress(fractionalProgress, animated: animated)
            _progressCount?.text = "\(counter)%"
            if(_progressCount?.text == "100%") {
                sleep(1)
                handler?(self)
            }
        }
    }
    
    //Handler is excuted when progress is 100%.
    open var handler: ((MPProgressDialog) -> Void)? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        progressBar = UIProgressView(frame: CGRect(x: 0, y: (frame.maxY)/3 + (frame.minY)*2/3, width: frame.width, height: (1)))
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: frame.height/12)
        progressBar.progress = 0.0
        addSubview(progressBar)
        if(_progressCount != nil) {
            bringSubview(toFront: _progressCount!)
        }
        cancleBtn = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 20, width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/12))
        cancleBtn.center.x = self.center.x
        cancleBtn.setTitle("cancle", for: .normal)
        cancleBtn.backgroundColor = .red
    
        addSubview(cancleBtn)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
