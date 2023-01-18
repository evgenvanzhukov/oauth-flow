//
//  AppDependencyContainer.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation
import UIKit

class AppDependencyContainer {
    
    func makeMainViewController() -> UIViewController {
        let oauthService = OAuthService(oauthClient: OAuthClient())
        let loginViewController = LoginViewController(oauthServise: oauthService)
        let navigationContoller = UINavigationController(rootViewController: loginViewController)
        
        return navigationContoller
    }
}
