//
//  MockLiveMatchData.swift
//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//

import Foundation

@testable import Club_Info

class MockLiveMatchData{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockLiveMatchJSONResponse = """
    {
        "success": 1,
        "result": [
            {
                        "event_key": 1222234,
                        "event_date": "2023-06-01",
                        "event_time": "20:45",
                        "event_home_team": "Stuttgart",
                        "home_team_key": 3933,
                        "event_away_team": "Hamburger SV",
                        "away_team_key": 3912,
                        "event_halftime_result": "1 - 0",
                        "event_final_result": "1 - 0",
                        "event_ft_result": "",
                        "event_penalty_result": "",
                        "event_status": "Half Time",
                        "country_name": "Germany",
                        "league_name": "Bundesliga - Relegation Round",
                        "league_key": 175,
                        "league_round": "",
                        "league_season": "2022/2023",
                        "event_live": "1",
                        "event_stadium": "Mercedes Benz Arena, Stuttgart",
                        "event_referee": "Tobias Welz, Germany",
                        "home_team_logo": "https://apiv2.allsportsapi.com/logo/3933_stuttgart.jpg",
                        "away_team_logo": "https://apiv2.allsportsapi.com/logo/3912_hamburg.jpg",
                        "event_country_key": 4,
                        "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/175_bundesliga.png",
                        "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/4_germany.png",
                        "event_home_formation": "4-4-2",
                        "event_away_formation": "4-3-3",
                        "fk_stage_key": 2190,
                        "stage_name": "Relegation Round",
                        "league_group": null,
                        "goalscorers": [
                            {
                                "time": "1",
                                "home_scorer": "K. Mavropanos",
                                "home_scorer_id": "2586072047",
                                "home_assist": "B. Sosa",
                                "home_assist_id": "3209205993",
                                "score": "1 - 0",
                                "away_scorer": "",
                                "away_scorer_id": "",
                                "away_assist": "",
                                "away_assist_id": "",
                                "info": "",
                                "info_time": "1st Half"
                            }
                        ],
                        "substitutes": [],
                        "cards": [
                            {
                                "time": "15",
                                "home_fault": "",
                                "card": "yellow card",
                                "away_fault": "L. Reis",
                                "info": "",
                                "home_player_id": "",
                                "away_player_id": "3386517416",
                                "info_time": "1st Half"
                            }
                        ],
                        "lineups": {
                            "home_team": {
                                "starting_lineups": [
                                    {
                                        "player": "Atakan Karazor",
                                        "player_number": 16,
                                        "player_position": 7,
                                        "player_country": null,
                                        "player_key": 2593232689,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Borna Sosa",
                                        "player_number": 24,
                                        "player_position": 5,
                                        "player_country": null,
                                        "player_key": 3209205993,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Chris Führich",
                                        "player_number": 22,
                                        "player_position": 9,
                                        "player_country": null,
                                        "player_key": 3081024688,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Enzo Millot",
                                        "player_number": 8,
                                        "player_position": 10,
                                        "player_country": null,
                                        "player_key": 3600769342,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Florian Müller",
                                        "player_number": 1,
                                        "player_position": 1,
                                        "player_country": null,
                                        "player_key": 2433823892,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Hiroki Ito",
                                        "player_number": 21,
                                        "player_position": 4,
                                        "player_country": null,
                                        "player_key": 356071683,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Josha Vagnoman",
                                        "player_number": 4,
                                        "player_position": 6,
                                        "player_country": null,
                                        "player_key": 2744743895,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Konstantinos Mavropanos",
                                        "player_number": 5,
                                        "player_position": 2,
                                        "player_country": null,
                                        "player_key": 2586072047,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Serhou Guirassy",
                                        "player_number": 9,
                                        "player_position": 11,
                                        "player_country": null,
                                        "player_key": 1297242007,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Waldemar Anton",
                                        "player_number": 2,
                                        "player_position": 3,
                                        "player_country": null,
                                        "player_key": 3256385381,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Wataru Endo",
                                        "player_number": 3,
                                        "player_position": 8,
                                        "player_country": null,
                                        "player_key": 2200374845,
                                        "info_time": ""
                                    }
                                ],
                                "substitutes": [
                                    {
                                        "player": "Dan-Axel Zagadou",
                                        "player_number": 23,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 4190412417,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Dennis Seimen",
                                        "player_number": 41,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 884633249,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Lilian Egloff",
                                        "player_number": 25,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 1708202090,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Luca Pfeiffer",
                                        "player_number": 20,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 3240657917,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Nikolas Nartey",
                                        "player_number": 28,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 1842333330,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Pascal Stenzel",
                                        "player_number": 15,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 1938968346,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Silas Katompa Mvumpa",
                                        "player_number": 14,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 4192059688,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Tanguy Coulibaly",
                                        "player_number": 7,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 653173950,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Tiago Tomás",
                                        "player_number": 10,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 2329567188,
                                        "info_time": ""
                                    }
                                ],
                                "coaches": [
                                    {
                                        "coache": "S. Hoeneß",
                                        "coache_country": null
                                    }
                                ],
                                "missing_players": []
                            },
                            "away_team": {
                                "starting_lineups": [
                                    {
                                        "player": "Bakery Jatta",
                                        "player_number": 18,
                                        "player_position": 9,
                                        "player_country": null,
                                        "player_key": 687974765,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Daniel Heuer Fernandes",
                                        "player_number": 1,
                                        "player_position": 1,
                                        "player_country": null,
                                        "player_key": 103312167,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Jean-Luc Dompe",
                                        "player_number": 27,
                                        "player_position": 11,
                                        "player_country": null,
                                        "player_key": 1815762352,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Jonas David",
                                        "player_number": 34,
                                        "player_position": 3,
                                        "player_country": null,
                                        "player_key": 584649879,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Jonas Meffert",
                                        "player_number": 23,
                                        "player_position": 7,
                                        "player_country": null,
                                        "player_key": 1935724064,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Ludovit Reis",
                                        "player_number": 14,
                                        "player_position": 8,
                                        "player_country": null,
                                        "player_key": 3386517416,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Miro Muheim",
                                        "player_number": 28,
                                        "player_position": 5,
                                        "player_country": null,
                                        "player_key": 2172917024,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Moritz Heyer",
                                        "player_number": 3,
                                        "player_position": 2,
                                        "player_country": null,
                                        "player_key": 1558446345,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Robert Glatzel",
                                        "player_number": 9,
                                        "player_position": 10,
                                        "player_country": null,
                                        "player_key": 3021436141,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Sebastian Schonlau",
                                        "player_number": 4,
                                        "player_position": 4,
                                        "player_country": null,
                                        "player_key": 2188422353,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Sonny Kittel",
                                        "player_number": 10,
                                        "player_position": 6,
                                        "player_country": null,
                                        "player_key": 4282526506,
                                        "info_time": ""
                                    }
                                ],
                                "substitutes": [
                                    {
                                        "player": "Anssi Suhonen",
                                        "player_number": 36,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 1356482061,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Elijah Akwasi Krahn",
                                        "player_number": 46,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 3557106979,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Filip Bilbija",
                                        "player_number": 7,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 400646903,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Francisco Montero",
                                        "player_number": 16,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 530698450,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Matheo Raab",
                                        "player_number": 19,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 433516931,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Nicolas Oliveira Kisilowski",
                                        "player_number": 47,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 2857864591,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Ogechika Heil",
                                        "player_number": 42,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 2001019881,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "Ransford Yeboah Königsdörffer",
                                        "player_number": 11,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 58933177,
                                        "info_time": ""
                                    },
                                    {
                                        "player": "William Mikelbrencis",
                                        "player_number": 2,
                                        "player_position": 0,
                                        "player_country": null,
                                        "player_key": 1904708453,
                                        "info_time": ""
                                    }
                                ],
                                "coaches": [
                                    {
                                        "coache": "T. Walter",
                                        "coache_country": null
                                    }
                                ],
                                "missing_players": []
                            }
                        },
                        "statistics": [
                            {
                                "type": "Penalty",
                                "home": "1",
                                "away": "0"
                            },
                            {
                                "type": "Attacks",
                                "home": "51",
                                "away": "42"
                            },
                            {
                                "type": "Dangerous Attacks",
                                "home": "25",
                                "away": "18"
                            },
                            {
                                "type": "On Target",
                                "home": "4",
                                "away": "0"
                            },
                            {
                                "type": "Off Target",
                                "home": "2",
                                "away": "3"
                            },
                            {
                                "type": "Shots Total",
                                "home": "7",
                                "away": "3"
                            },
                            {
                                "type": "Shots On Goal",
                                "home": "5",
                                "away": "0"
                            },
                            {
                                "type": "Shots Off Goal",
                                "home": "2",
                                "away": "2"
                            },
                            {
                                "type": "Shots Blocked",
                                "home": "0",
                                "away": "1"
                            },
                            {
                                "type": "Shots Inside Box",
                                "home": "6",
                                "away": "3"
                            },
                            {
                                "type": "Shots Outside Box",
                                "home": "1",
                                "away": "0"
                            },
                            {
                                "type": "Fouls",
                                "home": "4",
                                "away": "6"
                            },
                            {
                                "type": "Corners",
                                "home": "4",
                                "away": "0"
                            },
                            {
                                "type": "Offsides",
                                "home": "1",
                                "away": "1"
                            },
                            {
                                "type": "Ball Possession",
                                "home": "43%",
                                "away": "57%"
                            },
                            {
                                "type": "Yellow Cards",
                                "home": "0",
                                "away": "1"
                            },
                            {
                                "type": "Saves",
                                "home": "0",
                                "away": "4"
                            },
                            {
                                "type": "Passes Total",
                                "home": "183",
                                "away": "252"
                            },
                            {
                                "type": "Passes Accurate",
                                "home": "153",
                                "away": "217"
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

extension MockLiveMatchData : ServiceProtocol{
    func fetchData<T : Decodable>(for sport: Club_Info.SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void)  {
        if shouldReturnError{
            completionHandler(.failure(ResponseWithError.responseError))
        }else{
            do {
                let data : Data? = Data(mockLiveMatchJSONResponse.utf8)
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
    
    
