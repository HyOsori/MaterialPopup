//
//  MPDialog.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 7. 5..
//  Copyright © 2017년 com. All rights reserved.
//

import Foundation
import UIKit


/**
 MPDialogType's enumeration type.
 
 - checkList   : View which has multi checkbox list.
 - alert       : View which is custom alert View.
 - progressBar : View which is custom progressBar.
 - actionSheet : View which is custom default iphone's actionSheet.
 */
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

public typealias DialogButtonAction = () -> Void

struct checkListData {
    var textlabel : String!
    var mark : Bool!
}

//MPDialog's View.
/**
 MPDialog's main View.
 
 You can init with type you want. 
 */
@IBDesignable
class MPDialog: UIView {
    @IBInspectable open var mpDialogType: MPDialogType? = .checkList    // determine what dialog type is. Default is checkList.
    
    @IBInspectable open var mpOverlayViewColor: UIColor? = UIColor(white: 1.0, alpha: 0.3)       // overlayview's color
    
    open var mpProgressView: MPProgressDialog?
    
    open var mpCheckListView: MPCheckListDialog?
    
    var MPDialogDelegate: MPDialogDelegate?
    
    fileprivate var overLayView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
     Progress init
     
     - Parameter dialogType: MPProgressDialogType
    */
    init(MPProgressframe: CGRect, dialogType: MPProgressDialogType?, progressCompletionHandler: @escaping ((MPProgressDialog) -> Void)) {
        //실제 화면에서 보여주는 프레임!
        //print("frame in MPDialog \(MPProgressframe)")
        
        overLayView = UIView(frame: CGRect(x: -MPProgressframe.minX, y: -MPProgressframe.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        overLayView.backgroundColor = mpOverlayViewColor!
        super.init(frame: MPProgressframe)
        
        mpProgressView = MPProgressDialog(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), type: dialogType)
        mpProgressView?.progressType = dialogType
        
        mpProgressView?.progressTitle = "0%"
        //        mpProgressView?.progressBar.progress = 1.0
        mpProgressView?.handler = progressCompletionHandler
        
        mpProgressView?.cancelBtn.addTarget(self, action: #selector(onClickProgressCancelButton(_:)), for: .touchUpInside)
        
        self.addSubview(overLayView)
        addSubview(mpProgressView!)
        
    }
    
    func onClickProgressCancelButton(_ sender: UIButton) {
        print("in mpdialog")
        //delegate로 콜백을 넘겨주는 부분인데 optional이므로, delegate가 nil값일 경우에는 이 메소드를 타지 않는다.
        MPDialogDelegate?.progressCancelButtonCallback?()
    }
    
    func addItem(handler: @escaping ((MPProgressDialog) -> Void)) {
        mpProgressView = MPProgressDialog(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        mpProgressView?.progressTitle = "0%"
        mpProgressView?.handler = handler
        addSubview(mpProgressView!)
    }
    
    /**
     CheckList init
     
    */
    init(MPCheckListframe: CGRect, checkListData: [checkListData]) {
        overLayView = UIView(frame: CGRect(x: -MPCheckListframe.minX, y: -MPCheckListframe.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        overLayView.backgroundColor = mpOverlayViewColor!

        super.init(frame: MPCheckListframe)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickOverlayView(_:)))
        overLayView.addGestureRecognizer(tapGesture)
        
        mpCheckListView = MPCheckListDialog(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), checkListData: checkListData)
        self.addSubview(overLayView)
        addSubview(mpCheckListView!)
    }
    
    func onClickOverlayView(_ sender: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
    
}
