//
//  VKService.swift
//  oauth flow
//
//  Created by Evgen on 20.01.2023.
//

import Foundation

class VKService {
    
    func GetFriends(count: Int, offset: Int?, completion: @escaping (([Friend]) -> Void)) {
        var result: [Friend] = []
        ApiClient.shared.httpPost(url: "https://api.vk.com/method/friends.get?", body: "user_id=7195107&count=\(count)&offset\(offset ?? 0)&fields=bdate,photo_50,sex,status&v=5.131") { (response: RawResponse) in
            completion(response.response.items)
        }
    }
}
