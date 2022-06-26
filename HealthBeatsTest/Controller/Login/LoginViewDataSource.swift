//
//  LoginViewDataSource.swift
//  HealthBeatsTest
//
//  Created by Phincon on 26/06/22.
//

import Foundation
import UIKit

class LoginViewDataSource: NSObject {
    
    weak var view: LoginViewController?
    weak var tableView: UITableView?
    var dataSource : [String]?
    
    init(view: LoginViewController, tableView: UITableView? = nil, dataSource: [String]? = nil) {
        self.view = view
        self.tableView = tableView
        self.dataSource = dataSource
    }
    
}

extension LoginViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource?[indexPath.row] ?? ""
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view?.areaNumberLbl.text = dataSource?[indexPath.row] ?? ""
        self.view?.removeTransparentView()
    }
}
