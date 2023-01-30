//
//  LoginViewController.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import UIKit
import WebKit

class LoginViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    let oauthServise: OAuthServiceProtocol
    var webView: UIView!
    
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
        let webview = WKWebView(frame: self.view.frame, configuration: WKWebViewConfiguration() )
        webview.uiDelegate = self
        webview.navigationDelegate = self
        
        webview.load(URLRequest(url: url))
        print(webview)
        view.addSubview(webview)
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        guard let url = webView.url else { return }
        
        if url.fragment?.starts(with: "access_token") == true ||
            url.relativePath == "/auth_redirect" {
            
            if let token = oauthServise.parseTokenFromUrl(url: url) {
                accessToken = token
                let friendsController = FriendsViewController(VKService())

                navigationController?.pushViewController(friendsController, animated: true)
                
            }
        }
    }

    
}
