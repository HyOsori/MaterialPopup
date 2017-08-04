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
    var timer : Timer!
    var p: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //임의로 progressCount의 위치 등 변경할 수 있음.
//        dialog.mpProgressView?._progressCount?.frame = CGRect(x: 0, y: 150, width: 30, height: 30)
        
        linearProgressBtn = UIButton(frame: CGRect(x: 30, y: self.view.frame.height/2 - 50, width: 100, height: 100))
        linearProgressBtn.setTitle("LinearPrgress", for: .normal)
        linearProgressBtn.backgroundColor = .white
        linearProgressBtn.setTitleColor(.black, for: .normal)
        linearProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        linearProgressBtn.addTarget(self, action: #selector(onClickLinearProgress(_:)), for: .touchUpInside)
        
        circleProgressBtn = UIButton(frame: CGRect(x: 155, y: self.view.frame.height/2 - 50, width: 100, height: 100))
        circleProgressBtn.setTitle("LinearPrgress", for: .normal)
        circleProgressBtn.backgroundColor = .white
        circleProgressBtn.setTitleColor(.black, for: .normal)
        circleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        circleProgressBtn.addTarget(self, action: #selector(onClickCircleProgress(_:)), for: .touchUpInside)
        
        
        semicircleProgressBtn = UIButton(frame: CGRect(x: 280, y: self.view.frame.height/2 - 50, width: 100, height: 100))
        semicircleProgressBtn.setTitle("LinearPrgress", for: .normal)
        semicircleProgressBtn.backgroundColor = .white
        semicircleProgressBtn.setTitleColor(.black, for: .normal)
        semicircleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        semicircleProgressBtn.addTarget(self, action: #selector(onClickSemicircleProgress(_:)), for: .touchUpInside)
        
        self.view.addSubview(linearProgressBtn)
        self.view.addSubview(circleProgressBtn)
        self.view.addSubview(semicircleProgressBtn)
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func onClickLinearProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .linear, progressCompletionHandler: { (progressDialog) in
            print("aaaaaaa")
        })
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
    
    func onClickCircleProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .circular, progressCompletionHandler: { (progressDialog) in
            print("aaaaaaa")
        })
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
    
    func onClickSemicircleProgress(_ sender: UIButton) {
        
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .semicircle, progressCompletionHandler: { (progressDialog) in
            print("aaaaaaa")
        })
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

