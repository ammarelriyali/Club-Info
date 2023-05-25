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
    var dataSource:[League]=[]
    var arr:[League]=[]
    var modelView : LeaguesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = dataSource
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
     
        self.tableView.delegate=self
        self.tableView.dataSource=self
        modelView=LeaguesViewModel(service: Service.getInstans()){ [weak self] data in
            if let res = data{
                self?.dataSource=res.result
                self?.arr=self?.dataSource ?? []
                self?.tableView.reloadData()
            }
            else{
                showConnectionAlert(self)
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
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell",for: indexPath)
        
        
        (cell.viewWithTag(2) as! UILabel).text = arr[indexPath.row].leagueName
        (cell.viewWithTag(1) as! UIImageView).sd_setImage(with: URL(string: arr[indexPath.row].leagueLogo ?? ""),placeholderImage: UIImage(named: "lastUpdate"))
        (cell.viewWithTag(1) as! UIImageView).roundedImage()
        
        return cell
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
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            // Perform the filtering
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
        
        // Reload your table view to reflect the filtered data
        tableView.reloadData()
    }
    
}
