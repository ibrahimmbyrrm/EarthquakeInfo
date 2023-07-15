//
//  ApiService.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation

enum APIError : Error {
    case NetworkingError
    case ParsingError
    case InvalidURL
}

struct APIService {
    let requestURLString = "https://api.orhanaydogdu.com.tr/deprem/kandilli/live"
    
    func callAPI(completion : @escaping(Swift.Result<KandilliData?, APIError>)-> Void) {
        guard let url = URL(string: requestURLString) else {
            completion(.failure(.InvalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.NetworkingError))
                return
            }
            guard let data = data else {return}
            let jsonData = try? JSONDecoder().decode(KandilliData.self, from: data)
           
            guard let jsonData = jsonData else {
                completion(.failure(.ParsingError))
                return
            }
            completion(.success(jsonData))
        }.resume()
    }
}
