//
//  ClubInfoViewModel.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import Foundation

class ClubInfoViewModel {
    
    private let service:Service
    private let database : DatabaseManager
    var isRetrievalData : Observable<Bool> = Observable(value: nil)
    var team:Team = Team(teamKey: 0,teamLogo: "", teamName: "", players: [], coaches: [])
    init(service: Service, database: DatabaseManager) {
        self.database = database
        self.service = service
    }
    func getData(TeamID id:String){
    var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "met", value: "Teams"))
        queryItems.append(URLQueryItem(name: "teamId", value: id))
        service.fetchData(for: SportType.Football, queryItems: queryItems){
            [weak self] (result: Result<[Team]?, Error>) in
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
        database.saveTeam(withData: team)
    }
    
    func deleteTeam(){
        database.deleteTeam(withId: team.teamKey ?? 0 )
    }
    
    func isSaved()->Bool{
        return database.fetchAllTeams().contains(){
            $0.teamKey == team.teamKey
        }
    }
}
