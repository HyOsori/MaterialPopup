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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        progressBar = UIProgressView(frame: CGRect(x: 0, y: (frame.maxY)/3 + (frame.minY)*2/3, width: frame.width, height: (1)))
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: frame.height/12)    
        addSubview(progressBar)
    }
}
