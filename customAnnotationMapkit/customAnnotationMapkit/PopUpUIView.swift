//
//  PopUpView.swift
//  customAnnotationMapkit
//
//  Created by Vineeth Vijayan on 12/06/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import Foundation
import UIKit

class PopUpUIView: UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var _img: UIImageView!

    @IBOutlet weak var _tableView: UITableView!
    @IBOutlet weak var _btnClose: UIButton!
    
    override func didMoveToSuperview() {
        
        self._tableView.dataSource = self
        self._tableView.delegate = self
        
        _tableView.registerNib(UINib(nibName: "PopupViewTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self._tableView.reloadData()
        
    }
    
    //MARK: TableView Events
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PopupViewTableViewCell
        cell._lbl.text = "Title:" + indexPath.row.description
        cell._img.image = UIImage(named: "img" + indexPath.row.description)
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
}


