//
//  MPDialogProtocol.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 7. 23..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit

/**
 MPDialog's delegate that callback for on click cancel button.
 
 - note : Declare it as optional, If you do not want to use it, or if you do not want to receive callbacks, do not inherit MPDialogDelegate.
 */
@objc
public protocol MPDialogDelegate {
    @objc optional func onClickCancelButtonCallback()
    
    @objc optional func onClickOKButtonCallback()
}
