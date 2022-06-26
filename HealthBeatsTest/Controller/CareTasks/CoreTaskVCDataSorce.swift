//
//  CoreTaskVCDataSorce.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import UIKit

class CoreTaskVCDataSorce: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView?
    weak var view: BaseViewController?
    var fontFirstShow: Bool? = false
    var firstime : String = "1"
    
    init(tableView: UITableView? = nil, view: BaseViewController? = nil, fontFirstShow: Bool? = false) {
        super.init()
        self.tableView = tableView
        self.view = view
        self.fontFirstShow = fontFirstShow
        self.registerTbl()
    }
    
    func registerTbl(){
        tableView?.register(UINib(nibName: "CoreTaskCell", bundle: nil), forCellReuseIdentifier: "CoreTaskCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoreTaskCell", for: indexPath) as? CoreTaskCell else { return UITableViewCell() }
        
        cell.fontFirstShow = fontFirstShow
        cell.setContent()
        
        fontFirstShow = false
        
        cell.showPopUpAddResult = {
            [weak self] in
            guard let self = self else { return }
            self.view?.showDefaultAlert(with: "Result has been successfully added")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
