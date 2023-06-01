//
//  Service.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation
import Alamofire
class Service : ServiceProtocol {
    private let APIKey : String!
    private let baseUrl:URL!
    static var instans = Service()
    private init(){
        baseUrl  = URL(string:"https://apiv2.allsportsapi.com")
        APIKey = "271a78edfebd2c9f55b7b3246ac1e24e6d2488f0819318b1b5f6a480ecadae06"
    }
    
    func fetchData<T: Decodable>(for sport : SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void) {
        
        var components = URLComponents(url: baseUrl.appendingPathComponent(sport.path), resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        components?.queryItems?.append(URLQueryItem(name: "APIkey", value: APIKey))
        
        guard let url = components?.url else {
            completionHandler(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        AF.request(url)
            .validate()
            .responseDecodable(of: Respons<T>.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        
    }
    
    
}
