//
//  BaseViewController.swift
//  HealthBeatsTest
//
//  Created by Phincon on 24/06/22.
//

import UIKit

class BaseViewController: UIViewController {

    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    var loadingView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func showAlert(with alerts: DefaultAlert){
        let alert = UIAlertController(title: alerts.title, message: alerts.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alerts.actionButton.title, style: .default, handler: { [weak self] _ in
            
            guard let self = self else { return }
            if alerts.title == "Success" {
                let vc = CustomTabBarController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func showDefaultAlert(with message: String){
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = .lightGray
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10

            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)

            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
       
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async  {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
}
