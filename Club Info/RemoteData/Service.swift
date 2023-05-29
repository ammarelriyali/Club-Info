//
//  Service.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation
import Alamofire
class Service {
    private static var instans = Service()
    static func getInstans()->Service{
        return instans
    }
    private init(){}
    
    func getFootballLeaguesData(completionHandler: @escaping (Result<[League]?, Error>) -> Void ) {
        AF.request("https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=271a78edfebd2c9f55b7b3246ac1e24e6d2488f0819318b1b5f6a480ecadae06")
            .validate()
            .responseDecodable(of: MyLeaguseResult.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    print(response.error ?? "erorr in footbool leages")
                    completionHandler(.failure(error))
                }
            }
    }
            
    

    
}
