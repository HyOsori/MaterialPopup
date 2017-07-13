//
//  ViewController.swift
//  MaterialPopup
//
//  Created by Macbook Pro retina on 2017. 6. 28..
//  Copyright © 2017년 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var dialog : MPDialog!
    
    var dialogTestBtn: UIButton!
    var timer : Timer!
    var p: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialog = MPDialog(dialogType: .progressBar, frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200))
        
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
        for _ in 0..<100 {
            DispatchQueue.global().async {
                sleep(1)
                DispatchQueue.main.async {
                    self.dialog.mpProgressView?.counter += 1
                    return
                }
            }
        }
        self.dialog.addItem { (dialog) in
            print("aaaaaaa")
        }
        self.dialog.mpProgressView?.cancleBtn.addTarget(self, action: #selector(onClickCancleBtn(_:)), for: .touchUpInside)
    }
    
    func onClickCancleBtn(_ sender: UIButton) {
        self.dialog.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

