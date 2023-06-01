//
//  LeagueModelView.swift
//  Club Info
//
//  Created by ammar on 28/05/2023.
//

import Foundation

class LeagueModelView{
    private let service:Service
    var isRetrievalDataUpComingMatch : Observable<Bool>
    var UpComingMatchArr:[Event]
    
    var isRetrievalDataTeams : Observable<Bool>
    var TeamsArr:[Team]
    
    var isRetrievalDataLiveMatch : Observable<Bool>
    var LiveMatchArr:[Event]
    
    var type:SportType
   
    
    init(service: Service , type:SportType) {
        self.service = service
        isRetrievalDataUpComingMatch = Observable(value: nil)
        UpComingMatchArr = []
        
        isRetrievalDataTeams  = Observable(value: nil)
        TeamsArr = []
        
        isRetrievalDataLiveMatch  = Observable(value: nil)
        LiveMatchArr = []
        
        self.type = type
    }
    
    func getUpComingMatch(_ id:String ){
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "met", value: "Fixtures"))
        queryItems.append(URLQueryItem(name: "from", value: getStratDate()))
        queryItems.append(URLQueryItem(name: "to", value: getEndDate()))
        queryItems.append(URLQueryItem(name: "timezone", value: "Africa/Cairo"))
        queryItems.append(URLQueryItem(name: "leagueId", value: id))
        
        service.fetchData(for: type, queryItems: queryItems){
            [weak self] (result: Result<[Event]?, Error>) in
            switch result{
            case .success(let data):
                self?.UpComingMatchArr = data ?? []
                self?.isRetrievalDataUpComingMatch.value = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isRetrievalDataUpComingMatch.value = false
            }
            
        }
    }
    func getLiveMatch(_ id:String){
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "met", value: "Livescore"))
        queryItems.append(URLQueryItem(name: "timezone", value: "Africa/Cairo"))
        queryItems.append(URLQueryItem(name: "leagueId", value: id))
        service.fetchData(for: type, queryItems: queryItems){
            [weak self] (result: Result<[Event]?, Error>) in
            switch result{
            case .success(let data):
                self?.LiveMatchArr = data ?? []
                self?.isRetrievalDataLiveMatch.value = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isRetrievalDataLiveMatch.value = false
            }
            
        }
    }
    func getTeams(_ id:String){
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "met", value: "Teams"))
        queryItems.append(URLQueryItem(name: "leagueId", value: id))
        
        service.fetchData(for: type, queryItems: queryItems){
            [weak self] (result: Result<[Team]?, Error>) in
            switch result{
            case .success(let data):
                self?.TeamsArr = data ?? []
                self?.isRetrievalDataTeams.value = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isRetrievalDataTeams.value = false
            }
            
        }
    }
     func getTeamsTinnes(){
                isRetrievalDataTeams.value = true
    }
    
    
    private func getStratDate()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    private func getEndDate()-> String {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let modifiedDate = calendar.date(byAdding: .year, value: 1, to: currentDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        
        if let modifiedDate = modifiedDate {
            let formattedDate = dateFormatter.string(from: modifiedDate)
            return formattedDate
        }
        return dateFormatter.string(from: currentDate)
    }
    
    
}
