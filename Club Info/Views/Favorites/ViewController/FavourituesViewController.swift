//
//  FavourituesViewController.swift
//  Club Info
//
//  Created by ammar on 31/05/2023.
//

import UIKit
import Network

class FavourituesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var isConnect : Bool = true
    var viewModel : FavourtiesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favourites"
        tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: .main), forCellReuseIdentifier: "PlayerTableViewCell")
        viewModel =  FavourtiesViewModel(database: DatabaseManager.getInstans())
        viewModel.isRetrievalData.bind(){
            [weak self ] _ in
            self?.tableView.reloadData()
        }
        
        let monitor = NWPathMonitor()
       
        monitor.pathUpdateHandler = {[weak self] path in
            if path.status == .satisfied {
                self?.isConnect = true
                
            }
            else {
                self?.isConnect = false
                
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getData()
      
    }

    

    

}
extension FavourituesViewController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        cell.initializeCellTeam(viewModel.arr[indexPath.item] )
        return  cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            showAlert(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isConnect){
                    let league = storyboard?.instantiateViewController(withIdentifier: "ClubInfoViewController") as! ClubInfoViewController
                    league.id = String(viewModel.arr[indexPath.item].teamKey ?? 0 )
                    navigationController?.pushViewController(league, animated: true)
                
            } else {
            
                    showConnectionAlert(self)
                    
                }
            
            
           
        }
    
   
    
    
    
    func showAlert(_ id : Int) {
        let alert = UIAlertController(title: "Delete ", message: "you cinfirme to delete item",         preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {[weak self] _ in
            self?.viewModel.deleteTeam(id: self?.viewModel.arr[id].teamKey ?? 0)
            self?.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in

        }))

          self.present(alert, animated: true, completion: nil)
      }
}
