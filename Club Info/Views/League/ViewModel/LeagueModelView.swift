//
//  LeagueModelView.swift
//  Club Info
//
//  Created by ammar on 28/05/2023.
//

import Foundation

class LeagueModelView{
    private let service:Service
    var isRetrievalDataUpComingMatch : Observable<Bool> = Observable(value: nil)
    var UpComingMatchArr:[Event] = []
    
      var isRetrievalDataTeams : Observable<Bool> = Observable(value: nil)
    var TeamsArr:[Team] = []
    
      var isRetrievalDataLiveMatch : Observable<Bool> = Observable(value: nil)
    var LiveMatchArr:[Event] = []
    
    init(service: Service) {
        self.service = service

    }

    func getUpComingMatch(_ id:String){
        service.getEvent(StartDate: getStratDate(), EndDate: getEndDate(), leagueId:id){
            [weak self] result in
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
        service.getLiveEvent( leagueId:id){
            [weak self] result in
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
        service.getTeams(leagueId:id){
            [weak self] result in
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
