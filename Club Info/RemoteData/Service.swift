//
//  Service.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation
import Alamofire
class Service {
    static var instans = Service()
    static func getInstans()->Service{
        return instans
    }
    private init(){}
    
    func getFootballLeaguesData(completion: @escaping ((MyLeaguseResult?) -> Void)) {
        AF.request("https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=271a78edfebd2c9f55b7b3246ac1e24e6d2488f0819318b1b5f6a480ecadae06")
            .responseDecodable(of: MyLeaguseResult.self) { response in
                switch response.result {
                case .success(let value):
                    completion(value)
                case .failure:
                    print(response.error ?? "erorr in footbool leages")
                    completion(nil)
                }
            }
    }
            
    

    
}
