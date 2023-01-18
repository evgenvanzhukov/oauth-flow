//
//  OAuthClient.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation

protocol OAuthClientProtocol {
    func getAuthPageUrl() -> URL?
}

struct TokenBag {
    let accessToken: String
}

class OAuthClient: OAuthClientProtocol {
    func getAuthPageUrl() -> URL? {
        return nil
    }
    
    
}
