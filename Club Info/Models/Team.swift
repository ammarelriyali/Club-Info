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
    var coaches : [Coach]?
    
    
    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamLogo = "team_logo"
        case teamName = "team_name"
        case players = "players"
        case coaches = "coaches"
    }
}

struct Player: Decodable {
    let playerKey: Int?
    let playerName: String?
    let playerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerImage = "player_image"
    }
}

struct Coach : Decodable{
    let coachName: String?
    let coachCountry: String?
    let coachAge: Int?
    
    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
        case coachCountry = "coach_country"
        case coachAge = "coach_age"
    }
}
