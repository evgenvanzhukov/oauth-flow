//
//  Friend.swift
//  oauth flow
//
//  Created by Evgen on 20.01.2023.
//

import Foundation

public struct Friend : Codable  {
    var name: String
    var id: Int
    var surName: String?
    var photo: String?
    var sex: Int
    var status: String?

    
    private enum CodingKeys: String, CodingKey {
        case name = "first_name"
        case id = "id"
        case surName = "last_name"
        case sex = "sex"
        case status = "status"
        case photo = "photo_50"
    }
}
