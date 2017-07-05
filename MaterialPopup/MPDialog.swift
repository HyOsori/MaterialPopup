//
//  MPDialog.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 7. 5..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit


//Dialog Type
public enum MPDialogType {
    case checkList
    case alert
    case progressBar
    case actionSheet
}

//Dialog Animation
public enum MPDialogAnimationType {
    case pop
}


//MPDialog's View.
@IBDesignable
class MPDialog: UIView {
    @IBInspectable open var mpDialogType: MPDialogType? = .checkList    // determine what dialog type is. Default is checkList.
    
    @IBInspectable open var mpOverlayViewColor: UIColor? = UIColor(white: 1.0, alpha: 0.5)       // overlayview's color
    
    fileprivate var overLayView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    init(dialogType : MPDialogType, frame: CGRect) {
        print("frame.minX \(frame.minX)")
        
        overLayView = UIView(frame: CGRect(x: -frame.minX, y: -frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        overLayView.backgroundColor = mpOverlayViewColor!

        super.init(frame: frame)
        
        self.addSubview(overLayView)
        switch dialogType {
        case.checkList:
            backgroundColor = .green
            print("checkList!")
        case.alert:
            backgroundColor = .red
            print("alertView!")
        case.progressBar:
            backgroundColor = .gray
            
            var mpProgressView: MPProgressDialog!            
            mpProgressView = MPProgressDialog(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            mpProgressView.progressBar.progress = 1.0
            self.addSubview(mpProgressView)
            print("progressBar")
        case.actionSheet:
            backgroundColor = .gray
            print("actionSheet!")
        }
    }
    
}
