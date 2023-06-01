//
//  MockServiceData.swift
//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//


import Foundation
@testable import Club_Info

class MockLeaguesData{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockLeaguesJSONResponse = """
    {
        "success": 1,
        "result": [
            {
                "league_key": 4,
                "league_name": "UEFA Europa League",
                "country_key": 1,
                "country_name": "eurocups",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
                "country_logo": null
            },
            {
                "league_key": 1,
                "league_name": "European Championship",
                "country_key": 1,
                "country_name": "eurocups",
                "league_logo": null,
                "country_logo": null
            },
            {
                "league_key": 683,
                "league_name": "UEFA Europa Conference League",
                "country_key": 1,
                "country_name": "eurocups",
                "league_logo": null,
                "country_logo": null
            },
            {
                "league_key": 3,
                "league_name": "UEFA Champions League",
                "country_key": 1,
                "country_name": "eurocups",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png",
                "country_logo": null
            },
            {
                "league_key": 633,
                "league_name": "UEFA Nations League",
                "country_key": 1,
                "country_name": "eurocups",
                "league_logo": null,
                "country_logo": null
            },
            {
                "league_key": 28,
                "league_name": "World Cup",
                "country_key": 8,
                "country_name": "Worldcup",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/28_world-cup.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/8_worldcup.png"
            },
            {
                "league_key": 152,
                "league_name": "Premier League",
                "country_key": 44,
                "country_name": "England",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png"
            },
            {
                "league_key": 302,
                "league_name": "La Liga",
                "country_key": 6,
                "country_name": "Spain",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/302_la-liga.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/6_spain.png"
            },
            {
                "league_key": 207,
                "league_name": "Serie A",
                "country_key": 5,
                "country_name": "Italy",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/207_serie-a.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/5_italy.png"
            },
            {
                "league_key": 175,
                "league_name": "Bundesliga",
                "country_key": 4,
                "country_name": "Germany",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/175_bundesliga.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/4_germany.png"
            },
            {
                "league_key": 168,
                "league_name": "Ligue 1",
                "country_key": 3,
                "country_name": "France",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/168_ligue-1.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/3_france.png"
            },
            {
                "league_key": 344,
                "league_name": "Premier League",
                "country_key": 95,
                "country_name": "Russia",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/344_premier-league.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/95_russia.png"
            },
            {
                "league_key": 266,
                "league_name": "Primeira Liga",
                "country_key": 92,
                "country_name": "Portugal",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/266_primeira-liga.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/92_portugal.png"
            },
            {
                "league_key": 63,
                "league_name": "First Division A",
                "country_key": 23,
                "country_name": "Belgium",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/63_first-division-a.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/23_belgium.png"
            },
            {
                "league_key": 244,
                "league_name": "Eredivisie",
                "country_key": 82,
                "country_name": "Netherlands",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/244_eredivisie.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/82_netherlands.png"
            },
            {
                "league_key": 332,
                "league_name": "MLS",
                "country_key": 114,
                "country_name": "USA",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/332_mls.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/114_usa.png"
            },
            {
                "league_key": 322,
                "league_name": "Süper Lig",
                "country_key": 111,
                "country_name": "Turkey",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/322_süper-lig.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/111_turkey.png"
            },
            {
                "league_key": 99,
                "league_name": "Serie A",
                "country_key": 27,
                "country_name": "Brazil",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/99_serie-a.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/27_brazil.png"
            },
            {
                "league_key": 235,
                "league_name": "Liga MX",
                "country_key": 78,
                "country_name": "Mexico",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/235_liga-mx.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/78_mexico.png"
            },
            {
                "league_key": 279,
                "league_name": "Premiership",
                "country_key": 98,
                "country_name": "Scotland",
                "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/279_premiership.png",
                "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/98_scotland.png"
            }
    ]
}
"""
    
    enum ResponseWithError : Error {
        case responseError
        case decoderError
    }
}

extension MockLeaguesData : ServiceProtocol{
    func fetchData<T : Decodable>(for sport: Club_Info.SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void)  {
        if shouldReturnError{
            completionHandler(.failure(ResponseWithError.responseError))
        }else{
            do {
                let data : Data? = Data(mockLeaguesJSONResponse.utf8)
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
    
    
