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
    
    open var imageView: UIImageView!
    
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
            titleLabel.text = title
            addSubview(titleLabel)
            
            messageLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.origin.y + titleLabel.frame.height, width: frame.width, height: frame.height - titleLabel.frame.maxY - 50))
            messageLabel.textAlignment = .center
            messageLabel.text = message
            addSubview(messageLabel)
            
            okButton = UIButton(frame: CGRect(x: frame.width/2 - 60, y: frame.height - 50, width: 50, height: 30))
            okButton.setTitle("OK", for: .normal)
            okButton.setTitleColor(.black, for: .normal)
            okButton.titleLabel?.adjustsFontSizeToFitWidth = true
            addSubview(okButton)
            
            cancelButton = UIButton(frame: CGRect(x: frame.width/2 + 10, y: frame.height - 50, width: 50, height: 30))
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.setTitleColor(.black, for: .normal)
            cancelButton.titleLabel?.adjustsFontSizeToFitWidth = true
            addSubview(cancelButton)
            
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height/2))
            imageView.image = image!
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            titleLabel = UILabel(frame: CGRect(x: 0, y: frame.midY, width: frame.width, height: frame.height/4 > 40 ? 40 : frame.height/4))
            titleLabel.textAlignment = .center
            titleLabel.text = title
            addSubview(titleLabel)
            
            messageLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.origin.y + titleLabel.frame.height, width: frame.width, height: frame.height - titleLabel.frame.maxY - 50))
            messageLabel.textAlignment = .center
            messageLabel.center.y = (frame.midY + frame.maxY)/2
            messageLabel.text = message
            addSubview(messageLabel)
            
            okButton = UIButton(frame: CGRect(x: frame.width/2 - 60, y: frame.height - 50, width: 50, height: 30))
            okButton.setTitle("OK", for: .normal)
            okButton.setTitleColor(.black, for: .normal)
            okButton.titleLabel?.adjustsFontSizeToFitWidth = true
            addSubview(okButton)
            
            cancelButton = UIButton(frame: CGRect(x: frame.width/2 + 10, y: frame.height - 50, width: 50, height: 30))
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.setTitleColor(.black, for: .normal)
            cancelButton.titleLabel?.adjustsFontSizeToFitWidth = true
            
            addSubview(cancelButton)
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}
