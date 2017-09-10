//
//  ViewController.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 6. 28..
//  Copyright © 2017년 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MPDialogDelegate {    
    var dialog : MPDialog!
    var linearProgressBtn: UIButton!
    var circleProgressBtn: UIButton!
    var semicircleProgressBtn: UIButton!
    
    var checkListBtn: UIButton!
    var alertListBtn: UIButton!
    var alertListWithoutImageBtn: UIButton!
    var timer : Timer!
    var p: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //임의로 progressCount의 위치 등 변경할 수 있음.
//        dialog.mpProgressView?._progressCount?.frame = CGRect(x: 0, y: 150, width: 30, height: 30)
        
        // linear progress dialog button
        linearProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 200, width: 200, height: 50))
        linearProgressBtn.setTitle("LinearPrgress", for: .normal)
        linearProgressBtn.backgroundColor = .white
        linearProgressBtn.setTitleColor(.black, for: .normal)
        linearProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        linearProgressBtn.addTarget(self, action: #selector(onClickLinearProgress(_:)), for: .touchUpInside)
        
        // circular progress dialog button
        circleProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 130, width: 200, height: 50))
        circleProgressBtn.setTitle("CircularPrgress", for: .normal)
        circleProgressBtn.backgroundColor = .white
        circleProgressBtn.setTitleColor(.black, for: .normal)
        circleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        circleProgressBtn.addTarget(self, action: #selector(onClickCircleProgress(_:)), for: .touchUpInside)
        
        // semicircular progress dialog button
        semicircleProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 60, width: 200, height: 50))
        semicircleProgressBtn.setTitle("SemiCirclePrgress", for: .normal)
        semicircleProgressBtn.backgroundColor = .white
        semicircleProgressBtn.setTitleColor(.black, for: .normal)
        semicircleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        semicircleProgressBtn.addTarget(self, action: #selector(onClickSemicircleProgress(_:)), for: .touchUpInside)
        
        // checklist dialog button
        checkListBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 10, width: 200, height: 50))
        checkListBtn.setTitle("checkListBtn", for: .normal)
        checkListBtn.backgroundColor = .white
        checkListBtn.setTitleColor(.black, for: .normal)
        checkListBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        checkListBtn.addTarget(self, action: #selector(onClickCheckList(_:)), for: .touchUpInside)
        
        // alert dialog button
        alertListBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 80, width: 200, height: 50))
        alertListBtn.setTitle("alertListBtn", for: .normal)
        alertListBtn.backgroundColor = .white
        alertListBtn.setTitleColor(.black, for: .normal)
        alertListBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        alertListBtn.addTarget(self, action: #selector(onClickAlertList(_:)), for: .touchUpInside)
        
        // alert dialog without image button
        alertListWithoutImageBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 150, width: 200, height: 50))
        alertListWithoutImageBtn.setTitle("alertListBtn", for: .normal)
        alertListWithoutImageBtn.backgroundColor = .white
        alertListWithoutImageBtn.setTitleColor(.black, for: .normal)
        alertListWithoutImageBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        alertListWithoutImageBtn.addTarget(self, action: #selector(onClickAlertWithoutImage(_:)), for: .touchUpInside)
        
        self.view.addSubview(linearProgressBtn)
        self.view.addSubview(circleProgressBtn)
        self.view.addSubview(semicircleProgressBtn)
        self.view.addSubview(checkListBtn)
        self.view.addSubview(alertListBtn)
        self.view.addSubview(alertListWithoutImageBtn)
        self.view.backgroundColor = .black

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Alert dialog's method
    func onClickAlertList(_ sender: UIButton) {
        dialog = MPDialog(MPAlertframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), title: "Alert View title", image: UIImage(named: "jordan"), message: "Alert View message test...............")
        
        dialog.MPDialogDelegate = self
        dialog.showMPDialog(superController: self)
    }
    
    // Alert dialog without image's method
    func onClickAlertWithoutImage(_ sender: UIButton) {
        dialog = MPDialog(MPAlertframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), title: "Alert View title", image: nil, message: "Alert View message test...............")
        
        dialog.MPDialogDelegate = self
        dialog.showMPDialog(superController: self)
    }
    
    // Checklist dialog method
    func onClickCheckList(_ sender: UIButton) {
        
        var checkList: [checkListData]! = []
        checkList.append(checkListData(textlabel: "aaaaa", mark: false))
        checkList.append(checkListData(textlabel: "bbbbb", mark: false))
        checkList.append(checkListData(textlabel: "ccccc", mark: true))
        checkList.append(checkListData(textlabel: "ddddd", mark: false))
        checkList.append(checkListData(textlabel: "eeeee", mark: false))

        dialog = MPDialog(MPCheckListframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), checkListData: checkList)
        
        dialog.showMPDialog(superController: self)

        self.dismiss(animated: true, completion: nil)

    }
    
    // Linear progress dialog method
    func onClickLinearProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .linear, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        //Custom cacnelBtn.
//        self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self
        
        //default로 돌려버리는 메소드.
//        self.dialog.mpProgressView?.startProgress()
        
        DispatchQueue.global().async {
            for i in 0...100 {
                usleep(10000)
                DispatchQueue.main.async {
                    let j = Float(i)*0.01
                    self.dialog.mpProgressView?.updateProgress(fractionalProgress: j)
                }
            }
        }
    }
    
    // Circle progress dialog method
    func onClickCircleProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .circular, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        // Custom cacnelBtn.
        //        self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self
        
        //method that
        //        self.dialog.mpProgressView?.startProgress()
        
        DispatchQueue.global().async {
            for i in 0...100 {
                usleep(10000)
                DispatchQueue.main.async {
                    let j = Float(i)*0.01
                    self.dialog.mpProgressView?.updateProgress(fractionalProgress: j)
                }
            }
        }
    }
    
    // Semicircle progress dialog method
    func onClickSemicircleProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .semicircle, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        //Custom cacnelBtn.
        //        self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self
        
        //default로 돌려버리는 메소드.
        //        self.dialog.mpProgressView?.startProgress()
        
        DispatchQueue.global().async {
            for i in 0...100 {
                usleep(10000)
                DispatchQueue.main.async {
                    let j = Float(i)*0.01
                    self.dialog.mpProgressView?.updateProgress(fractionalProgress: j)
                }
            }
        }
    }            
    
    // method that on click cancel button's callback
    func onClickCancelButtonCallback() {
        self.dialog.removeFromSuperview()
    }
    
    // method that on click ok button's callback
    func onClickOKButtonCallback() {
        self.dialog.removeFromSuperview()
    }
    
    func onClickCancelBtn(_ sender: UIButton) {
        self.dialog.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

