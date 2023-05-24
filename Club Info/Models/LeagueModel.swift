//
//  LeagueModel.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation

class League: Decodable {
    var leagueKey: Int
    var leagueName: String
    var countryKey: Int
    var countryName: String
    var leagueLogo: String?
    var countryLogo: String?
}
class MyResult: Decodable{
    var success : Int
    var result : [League]
}
