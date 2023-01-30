//
//  DeepLink.swift
//  oauth flow
//
//  Created by Evgen on 18.01.2023.
//

import Foundation


/* чет слишком уж замороченный способ вызвать (URL) -> Void */
enum DeepLink: Hashable {
    
    case oAuth(URL)
    
    init?(url: URL) {
        /* что здесь происходит ?*/
        
        let authLinkToDeepLink: (URL) -> DeepLink = { .oAuth($0) }
        
        let deepLinkMap: [String: (URL) -> DeepLink] = [
            callbackUrlString : authLinkToDeepLink
        ]
        
        let deeplink = deepLinkMap.first( where: {
            url.absoluteString.hasPrefix($0.key)
        })?.value
        
        switch deeplink {
        case .some(let urlToDeepLink):
            self = urlToDeepLink(url)
        default:
            return nil
        }
        
        
    }
}


class DeepLinkHandler {
    
    typealias DeepLinkCallback = (DeepLink) -> Void
    
    var callbackMap : [DeepLink : DeepLinkCallback] = [:]
    
    func addCallback(_ callback: @escaping DeepLinkCallback, forDeepLink deeplink: DeepLink) {
        callbackMap[deeplink] = callback
    }
    
    func handleDeepLinkIfPossible(deeplink: DeepLink) {
        guard let callback = callbackMap[deeplink] else { return }
        
        callback(deeplink)
    }
    
}
