//
//  LeagueViewController.swift
//  Club Info
//
//  Created by ammar on 25/05/2023.
//

import UIKit

class LeagueViewController: UIViewController {
    
    @IBOutlet weak var upComingEvent: UICollectionView!
    
    @IBOutlet weak var teams : UICollectionView!
    @IBOutlet weak var liveMatch : UICollectionView!
    
    var viewModel : LeagueModelView!
    var idLeague : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LeagueModelView(idOfLeague: "0" )
        
        upComingEvent.dataSource = self
        upComingEvent.delegate   = self
        upComingEvent.register(UINib(nibName: "ComingEventCell", bundle: .main), forCellWithReuseIdentifier: "ComingEventCell")
        
        teams.dataSource = self
        teams.delegate   = self
        teams.register(UINib(nibName: "ClubsCell", bundle: .main), forCellWithReuseIdentifier: "ClubsCell")
        
        liveMatch.dataSource = self
        liveMatch.delegate   = self
        liveMatch.register(UINib(nibName: "ResultCell", bundle: .main), forCellWithReuseIdentifier: "ResultCell")

    }
}

extension LeagueViewController: UICollectionViewDataSource ,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView  == upComingEvent){
            return 4
        }
        else if (collectionView == liveMatch){
            return 5
        }
        else {
            return 8
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let  cell : UICollectionViewCell!
        
        if(collectionView  == upComingEvent){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingEventCell", for: indexPath) as! ComingEventCell
        }
        else if (collectionView == liveMatch){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as!
            ResultCell
        }
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubsCell", for: indexPath) as! ClubsCell
        }
        return cell
    }
    
}
