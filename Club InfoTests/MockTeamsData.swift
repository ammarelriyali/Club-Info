//
//  MockTeamsData.swift
//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//

import Foundation

@testable import Club_Info

class MockTeamsData{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockTeamsJSONResponse = """
    {
        "success": 1,
        "result": [
          {
                      "team_key": 80,
                      "team_name": "Manchester City",
                      "team_logo": "https://apiv2.allsportsapi.com/logo/80_manchester-city.jpg",
                      "players": [
                          {
                              "player_key": 1226924072,
                              "player_name": "S. Ortega",
                              "player_number": "18",
                              "player_country": null,
                              "player_type": "Goalkeepers",
                              "player_age": "30",
                              "player_match_played": "2",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/8433_s-ortega.jpg"
                          },
                          {
                              "player_key": 1486581392,
                              "player_name": "Ederson",
                              "player_number": "31",
                              "player_country": null,
                              "player_type": "Goalkeepers",
                              "player_age": "29",
                              "player_match_played": "34",
                              "player_goals": "0",
                              "player_yellow_cards": "3",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/19053_ederson.jpg"
                          },
                          {
                              "player_key": 2809550493,
                              "player_name": "S. Carson",
                              "player_number": "33",
                              "player_country": null,
                              "player_type": "Goalkeepers",
                              "player_age": "37",
                              "player_match_played": "0",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/32198_s-carson.jpg"
                          },
                          {
                              "player_key": 3284171198,
                              "player_name": "K. Walker",
                              "player_number": "2",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "32",
                              "player_match_played": "25",
                              "player_goals": "0",
                              "player_yellow_cards": "3",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/110790_k-walker.jpg"
                          },
                          {
                              "player_key": 2657400589,
                              "player_name": "Rúben Dias",
                              "player_number": "3",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "26",
                              "player_match_played": "26",
                              "player_goals": "0",
                              "player_yellow_cards": "3",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/35524_ruben-dias.jpg"
                          },
                          {
                              "player_key": 2892843871,
                              "player_name": "J. Stones",
                              "player_number": "5",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "28",
                              "player_match_played": "22",
                              "player_goals": "2",
                              "player_yellow_cards": "2",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/15614_j-stones.jpg"
                          },
                          {
                              "player_key": 1285504325,
                              "player_name": "N. Aké",
                              "player_number": "6",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "28",
                              "player_match_played": "25",
                              "player_goals": "1",
                              "player_yellow_cards": "2",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/14600_n-ake.jpg"
                          },
                          {
                              "player_key": 1625270943,
                              "player_name": "Aymeric Laporte",
                              "player_number": "14",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "28",
                              "player_match_played": "11",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/14593_aymeric-laporte.jpg"
                          },
                          {
                              "player_key": 4034160106,
                              "player_name": "M. Akanji",
                              "player_number": "25",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "27",
                              "player_match_played": "29",
                              "player_goals": "0",
                              "player_yellow_cards": "2",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/44359_m-akanji.jpg"
                          },
                          {
                              "player_key": 3282410665,
                              "player_name": "R. Lewis",
                              "player_number": "82",
                              "player_country": null,
                              "player_type": "Defenders",
                              "player_age": "18",
                              "player_match_played": "12",
                              "player_goals": "0",
                              "player_yellow_cards": "1",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/144893_r-lewis.jpg"
                          },
                          {
                              "player_key": 2604014592,
                              "player_name": "K. Phillips",
                              "player_number": "4",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "27",
                              "player_match_played": "10",
                              "player_goals": "0",
                              "player_yellow_cards": "1",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/54459_k-phillips.jpg"
                          },
                          {
                              "player_key": 3319995034,
                              "player_name": "İ. Gündoğan",
                              "player_number": "8",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "32",
                              "player_match_played": "30",
                              "player_goals": "8",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/110791_-gundoan.jpg"
                          },
                          {
                              "player_key": 781199712,
                              "player_name": "J. Grealish",
                              "player_number": "10",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "27",
                              "player_match_played": "28",
                              "player_goals": "5",
                              "player_yellow_cards": "4",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/20508_j-grealish.jpg"
                          },
                          {
                              "player_key": 2389086821,
                              "player_name": "Rodri",
                              "player_number": "16",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "26",
                              "player_match_played": "35",
                              "player_goals": "2",
                              "player_yellow_cards": "5",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/55158_rodri.jpg"
                          },
                          {
                              "player_key": 4271919118,
                              "player_name": "K. De Bruyne",
                              "player_number": "17",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "31",
                              "player_match_played": "31",
                              "player_goals": "7",
                              "player_yellow_cards": "1",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/110793_k-de-bruyne.jpg"
                          },
                          {
                              "player_key": 1562074377,
                              "player_name": "Bernardo Silva",
                              "player_number": "20",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "28",
                              "player_match_played": "33",
                              "player_goals": "4",
                              "player_yellow_cards": "4",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/37181_bernardo-silva.jpg"
                          },
                          {
                              "player_key": 2287286537,
                              "player_name": "Sergio Gómez",
                              "player_number": "21",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "22",
                              "player_match_played": "10",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/74646_sergio-gomez.jpg"
                          },
                          {
                              "player_key": 903408431,
                              "player_name": "M. Perrone",
                              "player_number": "32",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "20",
                              "player_match_played": "1",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/117339_m-perrone.jpg"
                          },
                          {
                              "player_key": 2538499189,
                              "player_name": "P. Foden",
                              "player_number": "47",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "22",
                              "player_match_played": "30",
                              "player_goals": "10",
                              "player_yellow_cards": "1",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/71929_p-foden.jpg"
                          },
                          {
                              "player_key": 1568757289,
                              "player_name": "C. Palmer",
                              "player_number": "80",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "21",
                              "player_match_played": "12",
                              "player_goals": "0",
                              "player_yellow_cards": "1",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/92978_c-palmer.jpg"
                          },
                          {
                              "player_key": 3012507397,
                              "player_name": "B. Knight",
                              "player_number": "96",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "20",
                              "player_match_played": "0",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/92980_b-knight.jpg"
                          },
                          {
                              "player_key": 3949424163,
                              "player_name": "S. Charles",
                              "player_number": "",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "19",
                              "player_match_played": "0",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/105089_s-charles.jpg"
                          },
                          {
                              "player_key": 36228330,
                              "player_name": "A. Robertson",
                              "player_number": "",
                              "player_country": null,
                              "player_type": "Midfielders",
                              "player_age": "20",
                              "player_match_played": "0",
                              "player_goals": "0",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/121697_a-robertson.jpg"
                          },
                          {
                              "player_key": 659972248,
                              "player_name": "E. Haaland",
                              "player_number": "9",
                              "player_country": null,
                              "player_type": "Forwards",
                              "player_age": "22",
                              "player_match_played": "34",
                              "player_goals": "36",
                              "player_yellow_cards": "5",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/68451_e-haaland.jpg"
                          },
                          {
                              "player_key": 1560441904,
                              "player_name": "J. Álvarez",
                              "player_number": "19",
                              "player_country": null,
                              "player_type": "Forwards",
                              "player_age": "23",
                              "player_match_played": "29",
                              "player_goals": "9",
                              "player_yellow_cards": "0",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/99605_j-alvarez.jpg"
                          },
                          {
                              "player_key": 2739453175,
                              "player_name": "R. Mahrez",
                              "player_number": "26",
                              "player_country": null,
                              "player_type": "Forwards",
                              "player_age": "32",
                              "player_match_played": "28",
                              "player_goals": "5",
                              "player_yellow_cards": "2",
                              "player_red_cards": "0",
                              "player_image": "https://apiv2.allsportsapi.com/logo/players/9249_r-mahrez.jpg"
                          }
                      ],
                      "coaches": [
                          {
                              "coach_name": "Pep Guardiola",
                              "coach_country": null,
                              "coach_age": null
                          }
                      ]
                  }
    ]
}
"""
    
    enum ResponseWithError : Error {
        case responseError
        case decoderError
    }
}

extension MockTeamsData : ServiceProtocol{
    func fetchData<T : Decodable>(for sport: Club_Info.SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void)  {
        if shouldReturnError{
            completionHandler(.failure(ResponseWithError.responseError))
        }else{
            do {
                let data : Data? = Data(mockTeamsJSONResponse.utf8)
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
    
    
