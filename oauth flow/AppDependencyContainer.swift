//
//  AppDependencyContainer.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation
import UIKit

let callbackUrlString = "https://oauth.vk.com/blank.html"
var accessToken: String? = nil

class AppDependencyContainer {
    
    let deeplinkHandler = DeepLinkHandler()
    
    func createMainViewController() -> UIViewController {
        
        let redirectUrl = URL(string: callbackUrlString)!
        
        let oauthService = OAuthService(oauthClient: OAuthClient())
        
        let callback: (DeepLink) -> Void = { deeplink in
            
            if case .oAuth(let url) = deeplink {
                oauthService.exchangeCodeForToken(url: url)
            }
            
        }
        
        deeplinkHandler.addCallback(callback, forDeepLink: DeepLink(url: redirectUrl)!)
        
        let loginViewController = LoginViewController(oauthServise: oauthService)
        
        let navigationContoller = UINavigationController(rootViewController: loginViewController)
        
        return navigationContoller
    }
}
