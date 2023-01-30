//
//  OAuthClient.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation

protocol OAuthClientProtocol {
    func getAuthPageUrl() -> URL?
    
    func exchangeCodeForToken(code: String, completion: @escaping (Result<TokenBag, Error>) -> Void)
}

struct TokenBag {
    let accessToken: String
}

class OAuthClient: OAuthClientProtocol {
    
    func exchangeCodeForToken(code: String, completion: @escaping (Result<TokenBag, Error>) -> Void) {
        
    }
    
    func getAuthPageUrl() -> URL? {
        
        var urlString = "https://oauth.vk.com/authorize?client_id="
        + "51527554"
        + "&display=page&redirect_uri="
        + "\(callbackUrlString)"
        + "&scope=friends&response_type=token&v=5.131"
        
        return URL(string: urlString)
    }
    
    
}
