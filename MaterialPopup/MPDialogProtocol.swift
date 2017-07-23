//
//  MPDialogProtocol.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 7. 23..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit


/*
 * MPDialog에 관한 delegate.
 * optional로 선언을 해주어서, 쓰고 싶지 않거나, 굳이 콜백을 받고 싶지 않다면, MPDialogDelegate를 상속 받지
 * 않으면 됨.
 */
@objc
public protocol MPDialogDelegate {
    @objc optional func progressCancelButtonCallback()
}
