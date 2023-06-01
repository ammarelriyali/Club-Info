//
//  FavourtiesViewModel.swift
//  Club Info
//
//  Created by ammar on 31/05/2023.
//

import Foundation
class FavourtiesViewModel {
private let database : DatabaseManager
var isRetrievalData : Observable<Bool> = Observable(value: nil)
var arr:[Team] = []
init( database: DatabaseManager) {
    self.database = database
}
func getData(){
    arr = database.fetchAllTeams()
    isRetrievalData.value = true
}

    func deleteTeam(id : Int){
        database.deleteTeam(withId: id )
        getData()
}

}
