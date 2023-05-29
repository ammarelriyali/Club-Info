//
//  LeaguesViewModel.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation

class LeaguesViewModel {
    private let service:Service = Service.getInstans()
    var isRetrievalData : Observable<Bool> = Observable(value: true)
    var dataSource:[League] = []
    var arr:[League] = []
    
    func getFootball(){
        service.getFootballLeaguesData(){
            [weak self] result in
            switch result{
            case .success(let data):
                self?.dataSource = data ?? []
                self?.arr = self?.dataSource ?? []
                self?.isRetrievalData.value = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isRetrievalData.value = false
            }
            
        }
        
    }
    func filterArr(_ text:String? ){
        if let searchText = text, !searchText.isEmpty {
            arr = dataSource.filter {
                if let x = $0.leagueName {
                    return x.lowercased().contains(searchText.lowercased())
                }
                else{
                    return false
                }
            }
        } else {
            // If the search text is empty, show the entire data array
            arr = dataSource
        }
        
    }
    
}
