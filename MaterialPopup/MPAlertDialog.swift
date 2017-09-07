//
//  MPAlertDialog.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 9. 4..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit

/**
 MPAlertDialog View
 - This View customize 'alert view'.
 */
class MPAlertDialog: UIView {
    
    ///Alert View's title
    open var titleLabel: UILabel!
    
    open var image: UIImageView!
    
    open var messageLabel: UILabel!
    
    open var cancelButton: UIButton!
    
    open var okButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, title: String?, image: UIImage?, message: String?) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        if(image == nil) {
            titleLabel = UILabel(frame: CGRect(x: 0, y: frame.midY/2, width: frame.width, height: frame.height/4 > 40 ? 40 : frame.height/4))
            titleLabel.textAlignment = .center
            titleLabel.backgroundColor = .gray
            titleLabel.text = title
            addSubview(titleLabel)
            
            messageLabel = UILabel(frame: CGRect(x: 0, y: frame.midY, width: frame.width, height: frame.height/4))
            messageLabel.textAlignment = .center
            messageLabel.backgroundColor = .blue
            messageLabel.text = message
            addSubview(messageLabel)
        } else {
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}
