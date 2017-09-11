# Table of Contents.
![Swift 3.0](https://img.shields.io/badge/swift-3.1-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![pod](https://img.shields.io/badge/pod-v1.0-lightgrey.svg)

[1. MaterialPopup](#materialpopup)

[2. Preview](#preview)

[3. Installation](#installation)

[4. Usage](#usage)

- [Progress Dialog](#progress)
  - [linear progress dialog](#linear)
  - [circular progress dialog](#circular)
  - [semicircular progress dialog](#semicircular)
- [Checklist Dialog](#checklist)
- [Alert Dialog](#alert)
  - [Alert list dialog](#list)
  - [Alert list without image dialog](#withoutimage)

[5. License](#license)


# <a name="materialpopup"> MaterialPopup </a>

MaterialPopup is Dialog that have 3 type(checkbox list, alert, progressbar) that customized

## <a name="preview"> Preview </a>

<table>
<tr>
<th>LinearProgress</th><th>CircularPrgress</th><th>SemiCirclePrgress</th>
</tr>
<tr>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/LinearProgress.gif" width='187' alt="checkList gif"></td>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/CircularProgress.gif" width='187' alt="Progressbar gif"></td>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/SemiCircularProgress.gif" width='187' alt="Progressbar gif"></td>
</tr>
<th>CheckList</th><th>AlertWithImage</th><th>AlertWithoutImage</th>
<tr>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/checkList.gif" width='187' alt="checkList gif"></td>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/alertList.gif" width='187' alt="Progressbar gif"></td>
<td><img src="https://github.com/HyOsori/MaterialPopup/blob/master/Images/alertListWithoutImage.gif" width='187' alt="Progressbar gif"></td>
</tr>
</table>

## <a name="installation"> Installation </a>
### CocoaPods
```
  pod "MaterialPopup", "~> 1.0"
```

### Manually
To install MaterialPopup manually in app,  just drag the MPDialog, MPProgressDialog, MPDialogProtocol, MPCheckListDialog, MPAlertDialog file into your project.

## <a name="usage"> Usage </a>
### <a name="progress"> Progress Dialog </a>
This library provide 3 types of progress dialog.<BR>

- linear type
- circular type
- semicircular type

When click cancle/ok button, cancle/ok button callback method is executed.

```swift
    // method that on click cancel button's callback
    func onClickCancelButtonCallback() {
        self.dialog.removeFromSuperview()
    }

    // method that on click ok button's callback
    func onClickOKButtonCallback() {
        self.dialog.removeFromSuperview()
    }
```

##### <a name="linear"><a/> linear progress dialog
- On ViewController, create create a button that pop up linear progress view when you click on it.

 ```swift
 linearProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 200, width: 200, height: 50))
linearProgressBtn.setTitle("LinearPrgress", for: .normal)
linearProgressBtn.backgroundColor = .white
linearProgressBtn.setTitleColor(.black, for: .normal)
linearProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
linearProgressBtn.addTarget(self, action: #selector(onClickLinearProgress(_:)), for: .touchUpInside)

self.view.addSubview(linearProgressBtn)
```

- On click method, setting dialog view's layout.

 ```swift
    func onClickLinearProgress(_ sender: UIButton) {

        // set dialog popup view layout
        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .linear, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        // start progress count
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        // Set cacnelBtn title.
        // self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self

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
 ```

##### <a name="circular"><a/> circular progress dialog
- On ViewController, create create a button that pop up circular progress view when you click on it.

 ```swift
 circleProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 130, width: 200, height: 50))
circleProgressBtn.setTitle("CircularPrgress", for: .normal)
circleProgressBtn.backgroundColor = .white
circleProgressBtn.setTitleColor(.black, for: .normal)
circleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
circleProgressBtn.addTarget(self, action: #selector(onClickCircleProgress(_:)), for: .touchUpInside)

self.view.addSubview(circleProgressBtn)
```

- On click method, setting circular progress view's layout

 ```swift
    func onClickCircleProgress(_ sender: UIButton) {

        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .circular, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        // Set cacnelBtn title.
        // self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self

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
 ```

##### <a name="semicircular"><a/> semicircular progress dialog
- On ViewController, create create a button that pop up semicircular progress view when you click on it.

 ```swift
semicircleProgressBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 60, width: 200, height: 50))
semicircleProgressBtn.setTitle("SemiCirclePrgress", for: .normal)
semicircleProgressBtn.backgroundColor = .white
semicircleProgressBtn.setTitleColor(.black, for: .normal)
semicircleProgressBtn.titleLabel?.adjustsFontSizeToFitWidth = true
semicircleProgressBtn.addTarget(self, action: #selector(onClickSemicircleProgress(_:)), for: .touchUpInside)

self.view.addSubview(semicircleProgressBtn)
```

- On click method, setting semicircle progress view's layout

 ```swift
     func onClickSemicircleProgress(_ sender: UIButton) {

        dialog = MPDialog(MPProgressframe: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200), dialogType: .semicircle, progressCompletionHandler: { (progressDialog) in
            print("progress completed")
        })
        dialog.showMPDialog(superController: self)
        self.dialog.mpProgressView?._progressCount?.text = "0%"
        self.dialog.mpProgressView?.counter = 0
        // Setting cacnelBtn title.
        // self.dialog.mpProgressView?.cancelBtn.setTitle("Cancel", for: .normal)
        self.dialog.MPDialogDelegate = self

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
 ```

### <a name="checklist"> Checklist Dialog </a>
This library provide checklist dialog. <BR>

- On ViewController, create a button that pop up check list view when you click on it.

 ```swift
checkListBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 10, width: 200, height: 50))
checkListBtn.setTitle("checkListBtn", for: .normal)
checkListBtn.backgroundColor = .white
checkListBtn.setTitleColor(.black, for: .normal)
checkListBtn.titleLabel?.adjustsFontSizeToFitWidth = true
checkListBtn.addTarget(self, action: #selector(onClickCheckList(_:)), for: .touchUpInside)

self.view.addSubview(checkListBtn)
```

- On click method, make cheklist array and checklist view's layout

 ```swift
 func onClickCheckList(_ sender: UIButton) {
       var checkList: [checkListData]! = []
       checkList.append(checkListData(textlabel: "checklist1", mark: false))
       checkList.append(checkListData(textlabel: "checklist2", mark: false))
       checkList.append(checkListData(textlabel: "checklist3", mark: true))
       checkList.append(checkListData(textlabel: "checklist4", mark: false))
       checkList.append(checkListData(textlabel: "checklist5", mark: false))

       dialog = MPDialog(MPCheckListframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), checkListData: checkList)

       dialog.showMPDialog(superController: self)

       self.dismiss(animated: true, completion: nil)

   }
 ```

### <a name="alert"> Alert Dialog </a>
This library provide 2 types of Alert Dialog.

- Alert with image
- Alert without image

When click cancle button, cancle button method is executed.

```swift
    func onClickCancelBtn(_ sender: UIButton) {
        self.dialog.removeFromSuperview()
    }

```

##### <a name="list"><a/> Alert list Dialog
- On ViewController, create a button that pop up check list view when you click on it.

 ```swift
alertListBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 80, width: 200, height: 50))
alertListBtn.setTitle("alertListBtn", for: .normal)
alertListBtn.backgroundColor = .white
alertListBtn.setTitleColor(.black, for: .normal)
alertListBtn.titleLabel?.adjustsFontSizeToFitWidth = true
alertListBtn.addTarget(self, action: #selector(onClickAlertList(_:)), for: .touchUpInside)

self.view.addSubview(alertListBtn)
```

- On click method, setting alert list view's layout

 ```swift
    func onClickAlertList(_ sender: UIButton) {
        dialog = MPDialog(MPAlertframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), title: "Alert View title", image: UIImage(named: "jordan"), message: "Alert View message test...............")

        dialog.MPDialogDelegate = self
        dialog.showMPDialog(superController: self)
    }
 ```


##### <a name="withoutimage"><a/> Alert list without image Dialog
- On ViewController, create a button that pop up check list view when you click on it.

 ```swift
alertListWithoutImageBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 150, width: 200, height: 50))
alertListWithoutImageBtn.setTitle("alertListBtn", for: .normal)
alertListWithoutImageBtn.backgroundColor = .white
alertListWithoutImageBtn.setTitleColor(.black, for: .normal)
alertListWithoutImageBtn.titleLabel?.adjustsFontSizeToFitWidth = true
alertListWithoutImageBtn.addTarget(self, action: #selector(onClickAlertWithoutImage(_:)), for: .touchUpInside)

self.view.addSubview(alertListWithoutImageBtn)

```

- On click method, setting alert list without image view's layout

 ```swift
    func onClickAlertWithoutImage(_ sender: UIButton) {
        dialog = MPDialog(MPAlertframe: CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: 300, height: 400), title: "Alert View title", image: nil, message: "Alert View message test...............")

        dialog.MPDialogDelegate = self
        dialog.showMPDialog(superController: self)
    }
 ```


## <a name="license"> License </a>
 ```
The MIT License (MIT)

Copyright (c) 2017 Hanyang Osori

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
