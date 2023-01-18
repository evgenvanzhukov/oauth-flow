//
//  LoginViewController.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    let oauthServise: OAuthServiceProtocol
    var button: UIButton = {
       let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.textColor = .white
        btn.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    init(oauthServise: OAuthService) {
        self.oauthServise = oauthServise
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.center = view.center

    }
    

    @objc func loginButtonPressed() {
        guard let url = oauthServise.getLoginUrl() else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true, completion: nil)
    }

}
