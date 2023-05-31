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
    let url = "271a78edfebd2c9f55b7b3246ac1e24e6d2488f0819318b1b5f6a480ecadae06"
    
    
    func getFootballLeaguesData(completionHandler: @escaping (Result<[League]?, Error>) -> Void ) {
        var parameters: [String: String] = [
            
            "APIkey": url,
            
            "met":"Leagues"
        ]
        AF.request("https://apiv2.allsportsapi.com/football/",parameters: parameters)
            .validate()
            .responseDecodable(of: MyLeaguseResult.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    func getEvent(StartDate from:String,EndDate to:String ,leagueId id:String ,completionHandler: @escaping (Result<[Event]?, Error>) -> Void  ) {
        var parameters: [String: String] = [
            
            "APIkey": url,
            
            
            "met" : "Fixtures",
            "from": from,
        "to" : to,
        "timezone" : "Africa/Cairo",
        "leagueId" : id
        ]
        AF.request("https://apiv2.allsportsapi.com/football/",parameters: parameters)
            .validate()
            .responseDecodable(of: MyEventResult.self) { response in
                
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    print(response.error ?? "erorr in footbool event")
                    completionHandler(.failure(error))
                }
            }
    }
    func getLiveEvent(leagueId id:String ,completionHandler: @escaping (Result<[Event]?, Error>) -> Void  ) {
        var parameters: [String: String] = [
            "APIkey": url,
            "met" : "Livescore",
            "timezone" : "Africa/Cairo",
            "leagueId" : id

        ]
        AF.request("https://apiv2.allsportsapi.com/football/",parameters: parameters)
            .validate()
            .responseDecodable(of: MyEventResult.self) { response in
              
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    print(response.error ?? "erorr in footbool live match")
                    completionHandler(.failure(error))
                }
            }
    }
    
    func getTeams(leagueId id:String ,completionHandler: @escaping (Result<[Team]?, Error>) -> Void  ) {
        var parameters: [String: String] = [
            "APIkey": url,
            "met" : "Teams",
            "timezone" : "Africa/Cairo",
            "leagueId" : id
        ]
        AF.request("https://apiv2.allsportsapi.com/football/",parameters: parameters)
            .validate()
            .responseDecodable(of: MyTeamResult.self) { response in
               
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    print(response.error ?? "erorr in footbool team")
                    completionHandler(.failure(error))
                }
            }
    }
    func getTeam(TeamID id : String,completionHandler :@escaping (Result<[Team]?, Error>) -> Void){
        var parameters: [String: String] = [
            "APIkey": url,
            "met" : "Teams",
            "teamId" : id
        ]
        AF.request("https://apiv2.allsportsapi.com/football/",parameters: parameters)
            .validate()
            .responseDecodable(of: MyTeamResult.self) { response in
//                if let request = response.request,
//                        let urlString = request.url?.absoluteString {
//                        print(urlString)
//                    }
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value.result))
                case .failure(let error):
                    print(response.error ?? "erorr in footbool team")
                    completionHandler(.failure(error))
                }
            }
    }
    
    
    
    
}
