//
//  EndPoint.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import Foundation

enum SportType {
    case Football
    case BasketBall
    case Cricket
    case Tennis
    
    var path : String {
        
        switch self {
        case .Football :
            return "football"
        case .BasketBall:
            return "basketball"
        case .Cricket:
            return "cricket"
        case .Tennis:
            return "tennis"
        }
    }
}

