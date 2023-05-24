//
//  LeaguesViewModel.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation

class LeaguesViewModel {
    let service:Service
    let completion: (MyLeaguseResult?) -> Void
    var x:Int = 0
    var myLeaguseResult:MyLeaguseResult? = nil {
        didSet{
            completion(myLeaguseResult)
        }
    }
    init(service: Service,completion: @escaping (MyLeaguseResult?) -> Void) {
        self.service = service
        self.completion = completion
    }
    func getFootball(){
        service.getFootballLeaguesData(){
            [weak self] data in
            self?.myLeaguseResult = data
        }
    }
    
}
