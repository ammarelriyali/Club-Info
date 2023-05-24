//
//  LeaguesViewModel.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation

class LeaguesViewModel {
    let service:Service
    init(service: Service) {
        self.service = service
    }
    func getFootball(){
        service.getFootballData()
    }
    
}
