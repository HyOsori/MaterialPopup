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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialog = MPDialog(dialogType: .progressBar, frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200))
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

