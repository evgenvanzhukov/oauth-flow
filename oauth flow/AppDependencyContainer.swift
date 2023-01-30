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
        
    func createMainViewController() -> UIViewController {
        
        let redirectUrl = URL(string: callbackUrlString)!
        
        let oauthService = OAuthService(oauthClient: OAuthClient())
        
        let loginViewController = LoginViewController(oauthServise: oauthService)
        
        let navigationContoller = UINavigationController(rootViewController: loginViewController)
        
        return navigationContoller
    }
}
