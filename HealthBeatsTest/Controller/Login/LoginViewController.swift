//
//  ViewController.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneNumberTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var signBtn: UIButton!{
        didSet {
            signBtn.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var phoneNumberAreaBtn: UIButton!
    @IBOutlet weak var stackViewPosition: UIStackView!
    @IBOutlet weak var areaNumberLbl: UILabel!
    
    let viewModel = LoginViewModel()
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    var dataSource = ["65", "62", "63"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        passwordTf.enablePasswordToggle()
        phoneNumberTf.delegate = self
        passwordTf.delegate = self
        phoneNumberTf.addTarget(self, action: #selector(checkTextFieldIsEmpty), for: .editingChanged)
        passwordTf.addTarget(self, action: #selector(checkTextFieldIsEmpty), for: .editingChanged)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTf.text = ""
        phoneNumberTf.text = ""
        signBtn.isEnabled = false
        signBtn.layer.backgroundColor = UIColor.red.withAlphaComponent(0.4).cgColor
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func checkTextFieldIsEmpty(){
        viewModel.checkTextFieldIsEmpty(phoneNumberTf: phoneNumberTf, passwordTf: passwordTf, signBtn: signBtn)
    }
    
    @IBAction func signBtnSelected(){
        showActivityIndicator()
        viewModel.showErrors.bind { [weak self](error) in
            guard let self = self else { return }
            self.hideActivityIndicator()
            if let error = error {
                self.showAlert(with: error)
            }
        }
        
        guard let phoneNumber = phoneNumberTf.text, !phoneNumber.isEmpty, let password = passwordTf.text, !password.isEmpty else { return }
        
        viewModel.signIn(id: areaNumberLbl.text ?? "65",phoneNumber: phoneNumber, pass: password)
    }
    
    @IBAction func selectedPhoneNumberArea(_ sender: UIButton){
        addTransparentView(frames: sender.frame)
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: 20, y: self.stackViewPosition.frame.origin.y + 57, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.gray.cgColor
        
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10 // Set As you want
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 20, y: self.stackViewPosition.frame.origin.y + 57, width: frames.width + 5, height: CGFloat(self.dataSource.count * 50))
            self.phoneNumberAreaBtn.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = phoneNumberAreaBtn.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 20, y: self.stackViewPosition.frame.origin.y + 57, width: frames.width, height: 0)
            
        }, completion: nil)
    }
}

extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        areaNumberLbl.text = dataSource[indexPath.row]
        removeTransparentView()
    }
}

