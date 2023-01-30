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
    
    init(oauthClient: OAuthClientProtocol) {
        client = oauthClient
    }
    
    
    func getLoginUrl() -> URL? {
        return client.getAuthPageUrl()
    }

}

extension OAuthServiceProtocol {
    func parseTokenFromUrl(url: URL) -> String? {
        
        if url.fragment?.starts(with: "access_token") == true {
            
            var components = URLComponents()
            components.query = url.fragment
            
            let token = components.queryItems?.first(where: {$0.name == "access_token"})?.value
            return token
        }
        
        if url.relativePath == "/auth_redirect" {
            
            print(url.pathComponents)
            
            var components = URLComponents()
            components.query = url.query
            
            
            if let authorizeUrlString = components.queryItems?.first(where: {$0.name == "authorize_url"})?.value,
               let decodedUrlString = authorizeUrlString.removingPercentEncoding?.removingPercentEncoding,
               let authorizeUrl = URL(string: decodedUrlString)
            {
                return parseTokenFromUrl(url: authorizeUrl)
            }
        }
        
        return nil
    }

}
