//
//  OAuthService.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation

protocol OAuthServiceProtocol {
    func getLoginUrl() -> URL?
    
}

class OAuthService: OAuthServiceProtocol {
    
    private let client: OAuthClientProtocol
    
    func getLoginUrl() -> URL? {
        return nil
    }
    
    

    
    init(oauthClient: OAuthClientProtocol) {
        client = oauthClient
    }
}
