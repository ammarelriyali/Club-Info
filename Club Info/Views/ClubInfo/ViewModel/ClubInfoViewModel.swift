//
//  ClubInfoViewModel.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import Foundation

class ClubInfoViewModel {
    
    private let service:Service
    var isRetrievalData : Observable<Bool> = Observable(value: nil)
    var team:Team = Team(teamKey: 0,teamLogo: "", teamName: "", players: [], coaches: [])
    init(service: Service) {
        self.service = service
    }
    func getData(TeamID id:String){
        service.getTeam(TeamID:id){
            [weak self] result in
            switch result{
            case .success(let data):
                self?.team = data?[0] ??  Team(teamKey: 0,teamLogo: "", teamName: "", players: [], coaches: [])
                self?.isRetrievalData.value = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isRetrievalData.value = false
            }
            
        }
    }
   
    func addTeam(){
        
    }
}
