//
//  ApiClient.swift
//  oauth flow
//
//  Created by Evgen on 20.01.2023.
//

import Foundation

public class ApiClient {
    let urlSession = URLSession.shared
    let decoder = JSONDecoder()
    
    public static var shared: ApiClient = try! ApiClient()
    
    var bearer: String
    
    init() throws {
        guard let token = accessToken else {
            throw "no token"
        }
        bearer = "bearer \(token)"
    }
    
    func httpPost<T>(url: String, body: String, completion: @escaping (T) -> Void) where T : Codable {
        guard let url =  URL(string: url+"&access_token=\(accessToken!)") else {
            return
        }
        var request = URLRequest(url: url)
        
        request.addValue(bearer, forHTTPHeaderField: "Authorization")
        request.httpBody = body.data(using: .utf8)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")

        
        urlSession.dataTask(with: request) { (data, response, err) in
            if data == nil || err != nil {

                return
            }
            do {
                _ = try self.decoder.decode(T.self, from: data!)
            }
            catch {
                print(error.localizedDescription)
            }

            
            guard let result: T =
                    try? self.decoder.decode(T.self, from: data!)
            else {
                print("JSON: \(String(data: data!, encoding: .utf8))")
                return
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }.resume()
    }
}

extension String : Error {}
