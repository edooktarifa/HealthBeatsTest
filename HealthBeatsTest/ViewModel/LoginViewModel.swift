//
//  LoginViewModel.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewModel {
    
    var showErrors : Bindable<DefaultAlert?> = Bindable(nil)
    
    func signIn(id: String, phoneNumber: String, pass: String) {
        
        Auth.auth().signIn(withEmail: "+\(id)\(phoneNumber)@gmail.com", password: pass) { [weak self] (result, error) in
            
            guard let self = self else { return }
            
            if error == nil {
                Prefs.setData(.login, value: nil)
                self.showAlertWithTitle(status: "Success", message: "Congratulations! Authentication Success!")
            } else {
                self.showAlertWithTitle(status: "Failed", message: "Sorry! Authentication Failed!")
            }
        }
        
    }
    
    func showAlertWithTitle(status: String, message: String){
        let showErrorNetwork = DefaultAlert(title: status, message: message, actionButton: DefaultAlertAction(title: "OK", handler: nil))
        
        self.showErrors.value = showErrorNetwork
    }
    
    func checkTextFieldIsEmpty(phoneNumberTf: UITextField, passwordTf: UITextField, signBtn: UIButton){
        if phoneNumberTf.text != "" && passwordTf.text != "" {
            DispatchQueue.main.async {
                signBtn.isEnabled = true
                signBtn.layer.backgroundColor = UIColor.red.cgColor
            }
            
        } else {
            DispatchQueue.main.async {
                signBtn.isEnabled = false
                signBtn.layer.backgroundColor = UIColor.red.withAlphaComponent(0.4).cgColor
            }
            
        }
    }
    
}
