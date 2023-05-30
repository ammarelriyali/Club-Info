//
//  Team.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import Foundation


class MyTeamResult: Decodable{
    var success : Int?
    var result : [Team]?
}
struct Team: Decodable {
    var teamKey: Int?
    var teamLogo: String?
    var teamName: String?
    var players : [Player]?
    

     enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamLogo = "team_logo"
        case teamName = "team_name"
        case players = "players"
   
    }
 
}
struct Player: Decodable {
    let playerKey: Int?
    let playerName: String?
    let playerImage: URL?
    
    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerImage = "player_image"
    }
}

