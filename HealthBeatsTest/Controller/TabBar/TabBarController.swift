//
//  TabBarController.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .darkGray
        
        let controller1 = CareTasksVC()
        controller1.tabBarItem = UITabBarItem(title: "Care Tasks", image: UIImage(named: "ic_care_task_selected"), tag: 1)
        let nav1 = UINavigationController(rootViewController: controller1)

        let controller2 = CarePlansVC()
        controller2.tabBarItem = UITabBarItem(title: "Care Plans", image: UIImage(named: "ic_care_plans"), selectedImage: UIImage(named: "ic_care_plans"))
        let nav2 = UINavigationController(rootViewController: controller2)
        
        let controller3 = VitalsVC()
        controller3.tabBarItem = UITabBarItem(title: "Vitals", image: UIImage(named: "ic_vitals"), selectedImage: UIImage(named: "ic_vitals"))
        let nav3 = UINavigationController(rootViewController: controller3)
        
        let controller4 = CareChatVC()
        controller4.tabBarItem = UITabBarItem(title: "Care Chat", image: UIImage(named: "ic-chat"), selectedImage: UIImage(named: "ic-chat"))
        let nav4 = UINavigationController(rootViewController: controller4)

        viewControllers = [nav1, nav2, nav3, nav4]
    }

}


