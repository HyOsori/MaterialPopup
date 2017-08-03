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
    
    var dialogTestBtn: UIButton!
    var timer : Timer!
    var p: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .circular, progressCompletionHandler: { (progressDialog) in
            print("aaaaaaa")
        })
        
        //임의로 progressCount의 위치 등 변경할 수 있음.
//        dialog.mpProgressView?._progressCount?.frame = CGRect(x: 0, y: 150, width: 30, height: 30)
        
        dialogTestBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 50, y: self.view.frame.height/2 - 50, width: 100, height: 100))
        dialogTestBtn.setTitle("TestDialogPrgressBar", for: .normal)
        dialogTestBtn.backgroundColor = .black
        dialogTestBtn.addTarget(self, action: #selector(onClickDialogTestBtn(_:)), for: .touchUpInside)
        
        
        self.view.addSubview(dialogTestBtn)
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func onClickDialogTestBtn(_ sender: UIButton) {
        self.view.addSubview(dialog)
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
    
    //ProgressBar에서 취소 버튼을 눌렀을 경우에 대한 콜백을 받는 함수.
    func progressCancelButtonCallback() {
        print("this Work?")
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

