//
//  Response.swift
//  oauth flow
//
//  Created by Evgen on 21.01.2023.
//

import Foundation

struct RawResponse : Codable {
    var response: Response
    
}

struct Response: Codable {
    var count: Int
    var items: [Friend]
}
