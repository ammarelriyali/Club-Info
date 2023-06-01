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
    
    
    @IBOutlet weak var teamsLabel: UILabel!
    @IBOutlet weak var liveMatchlabel: UILabel!
    @IBOutlet weak var labelUpcoming: UILabel!
    @IBOutlet weak var indicatorLiveMatch: UIActivityIndicatorView!
    @IBOutlet weak var indicatorTeams: UIActivityIndicatorView!
    @IBOutlet weak var indicatorUpcomingEvent: UIActivityIndicatorView!
    var viewModel : LeagueModelView!
    var idLeague : String!
    var  type : SportType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "League Details"
        viewModel = LeagueModelView(service: Service.instans,type: type)
        
        configUpCOmingEventFlow()
        configUpCOmingEventData()
        
        configTeamsFlow()
        configTeamsData()
        
        configLiveMatchFlow()
        configLiveMatchData()
        
        setUpLabel()
        showIndicator()
        
        
    }
    func setUpLabel(){
        teamsLabel.isHidden = true
        labelUpcoming.isHidden = true
        liveMatchlabel.isHidden = true
    }
    func showIndicator(){
        indicatorTeams.startAnimating()
        indicatorUpcomingEvent.startAnimating()
        indicatorLiveMatch.startAnimating()
    }
    
    func configUpCOmingEventFlow(){
        upComingEvent.dataSource = self
        upComingEvent.delegate   = self
        upComingEvent.register(UINib(nibName: "ComingEventCell", bundle: .main), forCellWithReuseIdentifier: "ComingEventCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width - 50, height: upComingEvent.frame.height - 10)
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        
        upComingEvent.collectionViewLayout = layout
        
    }
    func configUpCOmingEventData(){
        viewModel.getUpComingMatch(idLeague)
        viewModel.isRetrievalDataUpComingMatch.bind(){
            [weak self] state in
            if let state = state {
                self?.indicatorUpcomingEvent.stopAnimating()
                self?.indicatorUpcomingEvent.isHidden = true
                if(self?.viewModel.UpComingMatchArr.isEmpty ?? false && state){
                    self?.labelUpcoming.isHidden = false
                    
                }
                else if(state){
                    self?.upComingEvent.reloadData()
                }
                else{
                    showConnectionAlert(self)
                }
                
            }
            
        }
    }
    
    func  configTeamsFlow(){
        teams.dataSource = self
        teams.delegate   = self
        teams.register(UINib(nibName: "ClubsCell", bundle: .main), forCellWithReuseIdentifier: "ClubsCell")
        
    }
    func configTeamsData(){
        if(type == SportType.Tennis){
            viewModel.getTeamsTinnes()
            teamsLabel.text = "No Player found"
        }
        else {
            viewModel.getTeams(idLeague)}
        viewModel.isRetrievalDataTeams.bind(){
            [weak self] state in
            if let state = state {
                
                self?.indicatorTeams.stopAnimating()
                self?.indicatorTeams.isHidden = true
                if(self?.viewModel.TeamsArr.isEmpty ?? false && state){
                    self?.teamsLabel.isHidden = false
                    
                }
                else if(state){
                    self?.teams.reloadData()
                }
                else{
                    showConnectionAlert(self)
                }
                
            }
            
        }
    }
    
    func  configLiveMatchFlow(){
        
        liveMatch.dataSource = self
        liveMatch.delegate   = self
        liveMatch.register(UINib(nibName: "ResultCell", bundle: .main), forCellWithReuseIdentifier: "ResultCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width - 10,height:  150)
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        
        liveMatch.collectionViewLayout = layout
    }
    func configLiveMatchData(){
        viewModel.getLiveMatch(idLeague)
        viewModel.isRetrievalDataLiveMatch.bind(){
            [weak self] state in
            if let state = state {
                self?.indicatorLiveMatch.stopAnimating()
                self?.indicatorLiveMatch.isHidden = true
                if(self?.viewModel.LiveMatchArr.isEmpty ?? false && state){
                    self?.liveMatchlabel.isHidden = false
                }
                else if(state){
                    self?.liveMatch.reloadData()
                }
                else{
                    showConnectionAlert(self)
                }
                
            }
            
        }
    }
    
}

extension LeagueViewController: UICollectionViewDataSource ,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView  == upComingEvent){
            return viewModel.UpComingMatchArr.count
        }
        else if (collectionView == liveMatch){
            return viewModel.LiveMatchArr.count
        }
        else {
            return viewModel.TeamsArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        if(collectionView  == upComingEvent){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingEventCell", for: indexPath) as! ComingEventCell
            cell.initializeCell(viewModel.UpComingMatchArr[indexPath.item],Image: type.path)
            return cell
            
        }
        else if (collectionView == liveMatch){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as!
            ResultCell
            cell.initializeCell(viewModel.LiveMatchArr[indexPath.item],Image: type.path)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubsCell", for: indexPath) as! ClubsCell
            
            cell.initializeCell(viewModel.TeamsArr[indexPath.item].teamLogo ?? "",Image: type.path)
            return  cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == teams){
            if(type == SportType.Football){
                let league = storyboard?.instantiateViewController(withIdentifier: "ClubInfoViewController") as! ClubInfoViewController
                league.id = String(viewModel.TeamsArr[indexPath.item].teamKey ?? 0 )
                navigationController?.pushViewController(league, animated: true)
            }
            else {
                
                let alert = UIAlertController(title: "No details for Teams", message: "can't open any team details",         preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                    
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
