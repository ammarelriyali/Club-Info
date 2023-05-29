//
//  LeaguesViewController.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import UIKit
import SDWebImage

class LeaguesViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    var type :HomeType!
    
    var modelView : LeaguesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        self.tableView.delegate=self
        self.tableView.dataSource=self
        modelView=LeaguesViewModel()
        
        modelView.isRetrievalData.bind(){
            data in
            if let data = data {
                if(data){
                    self.tableView.reloadData()
                }
                else{
                    showConnectionAlert(self)
                }
            }
            
        }
        
        checkTypeToHitAPI()
        
    }
    
    func checkTypeToHitAPI(){
        switch(type!){
            
        case HomeType.Football:
            modelView.getFootball()
            break
        case .BasketBall:
            break
        case .Cricket:
            break
        case .Tennis:
            break
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelView.arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell",for: indexPath)
        
        
        (cell.viewWithTag(2) as! UILabel).text = modelView.arr[indexPath.row].leagueName
        (cell.viewWithTag(1) as! UIImageView).sd_setImage(with: URL(string: modelView.arr[indexPath.row].leagueLogo ?? ""),placeholderImage: UIImage(named: "lastUpdate"))
        (cell.viewWithTag(1) as! UIImageView).roundedImage()
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let league = storyboard?.instantiateViewController(withIdentifier: "LeagueViewController") as! LeagueViewController
        league.idLeague = String (modelView.arr[indexPath.row].leagueKey ?? 0)
        navigationController?.pushViewController(league, animated: true)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension LeaguesViewController: UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
        modelView.filterArr(searchController.searchBar.text)
        
        tableView.reloadData()
    }
    
}
