//
//  MPCheckListDialog.swift
//  MaterialPopup
//
//  Created by seohui on 06/08/2017.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class checkListCell: UITableViewCell {
    
    var checklist: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        checklist = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        addSubview(checklist)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MPCheckListDialog: UIView, UITableViewDelegate,UITableViewDataSource {
    var checkListTableView: UITableView!
    var checkListData: [checkListData]! = []
    
    init(frame: CGRect, checkListData: [checkListData]) {
        super.init(frame: frame)
        self.checkListData = checkListData
        checkListTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        checkListTableView.register(checkListCell.self, forCellReuseIdentifier: "checkListCell")
        checkListTableView.delegate = self
        checkListTableView.dataSource = self
        checkListTableView.tableFooterView = UIView(frame: .zero)
        checkListTableView.backgroundColor = .white
        addSubview(checkListTableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkListData[indexPath.row].mark = !checkListData[indexPath.row].mark
        if(checkListData[indexPath.row].mark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListCell", for: indexPath) as! checkListCell
        cell.checklist.text = checkListData[indexPath.row].textlabel
        //cell.accessoryType = .checkmark
        if(checkListData[indexPath.row].mark) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

