//
//  CareTasksVC.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import UIKit

class CareTasksVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: CoreTaskVCDataSorce?
    var fontFirstShow: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: -Setup Tableview
    func setupTableView(){
        self.title = "CareTask"
        fontFirstShow = true
        dataSource = CoreTaskVCDataSorce(tableView: tableView, view: self, fontFirstShow: fontFirstShow)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutDidTap))
    }
    
    // MARK: -Remove preference after click logout button
    @objc func logOutDidTap(sender: UIBarButtonItem) {
        Prefs.removeData(.login)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginNav")
            
            let share = UIApplication.shared
                .delegate as? AppDelegate
            share?.window?.rootViewController = nextViewController
            share?.window?.makeKeyAndVisible()
        }
    }
    
}
