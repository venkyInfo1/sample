//
//  BaseVC.swift
//  MV
//
//  Created by Apple on 13/05/22.
//

import UIKit

class BaseVC: UIViewController {
    
    var loader = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLoader()
        // Do any additional setup after loading the view.
    }
    
    func setupLoader() {
        self.loader = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        self.loader.center = self.view.center
        self.loader.style = .medium
        self.loader.backgroundColor = .lightGray
        self.loader.tintColor = .darkGray
        self.loader.layer.cornerRadius = 8
        self.view.addSubview(self.loader)
        self.loader.isHidden = true
    }

    func startLoader() {
        self.loader.isHidden = false
        self.view.isUserInteractionEnabled = false
        self.loader.startAnimating()
    }
    
    func stopLoader() {
        DispatchQueue.main.async {
            self.loader.isHidden = true
            self.view.isUserInteractionEnabled = true
            self.loader.stopAnimating()
        }
    }
    
    //MARK: Alert
    func showAlert(_ messageStr: String?) {
        let alertController = UIAlertController.init(title: "Info", message: messageStr, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .default) { actions in
            self.dismiss(animated: true)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
