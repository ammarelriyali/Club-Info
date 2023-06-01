//
//  MockComingEventData.swift
//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//

import Foundation
@testable import Club_Info

class MockComingEventData{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockComingEventJSONResponse = """
    {
        "success": 1,
        "result": [
     {
       "event_key": 12345,
       "event_date": "2023-05-30",
       "event_time": "18:00",
       "event_home_team": "Home Team",
       "event_away_team": "Away Team",
       "home_team_logo": "https://example.com/home_team_logo.png",
       "away_team_logo": "https://example.com/away_team_logo.png",
       "event_final_result": "3-2"
     }
    ]
}
"""
    
    enum ResponseWithError : Error {
        case responseError
        case decoderError
    }
}

extension MockComingEventData : ServiceProtocol{
    func fetchData<T : Decodable>(for sport: Club_Info.SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void)  {
        if shouldReturnError{
            completionHandler(.failure(ResponseWithError.responseError))
        }else{
            do {
                let data : Data? = Data(mockComingEventJSONResponse.utf8)
                if let d =  data {
                    let json = try JSONDecoder().decode(Respons<T>.self,from:  d)
                    completionHandler(.success(json.result))
                }
                else{
                    print("Failure")
                    completionHandler(.failure(ResponseWithError.decoderError ))
                    
                }
            }catch{
                print ("Error \(error.localizedDescription)")
                completionHandler(.failure(error) )
            }
        }
    }
}
    
    
