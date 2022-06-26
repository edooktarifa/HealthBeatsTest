//
//  Prefs.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import Foundation
import UIKit
class Prefs {
    enum Keys: String {
        case login = "login"
    }
    
    static func setData(_ key: Keys, value: Any?) {
        UserDefaults.standard.setValue("login", forKey: key.rawValue)
    }
    
    static func getString(_ key: Keys) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    static func removeData(_ key: Keys){
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
}
