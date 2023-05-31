//
//  ClubInfoViewController.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import UIKit

class ClubInfoViewController: UIViewController {

    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var coachName: UILabel!
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var imageClub: UIImageView!
    @IBOutlet weak var FavIcon: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var id : String!
    
    var viewModel:ClubInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageClub.roundedImage()
        indicator.startAnimating()
        
              tableVIew.register(UINib(nibName: "PlayerTableViewCell", bundle: .main), forCellReuseIdentifier: "PlayerTableViewCell")

        viewModel = ClubInfoViewModel(service: Service.getInstans(),database: DatabaseManager.getInstans())
        viewModel.getData(TeamID: id)
        
        viewModel.isRetrievalData.bind(){
            [weak self] state in
            if let state = state {
                self?.indicator.stopAnimating()
                self?.indicator.isHidden = true
                 if(state){
                    self?.tableVIew.reloadData()
                     self?.imageClub.sd_setImage(with: URL(string: self?.viewModel.team.teamLogo ??  ""),placeholderImage: UIImage(named: "lastUpdate"))
                     self?.clubName.text = self?.viewModel.team.teamName
                     self?.coachName.text = self?.viewModel.team.coaches?[0].coachName
                     if(self?.viewModel.isSaved() ?? false ){
                         self?.FavIcon.image = UIImage(systemName: "heart.fill")
                         print("saved")
                     }
                     else {
                         self?.FavIcon.image = UIImage(systemName: "heart")
                         print("not saved")
                     }
                }
                else{
                    showConnectionAlert(self)
                }
                
            }
            
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        FavIcon.isUserInteractionEnabled = true
        FavIcon.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if(viewModel.team.teamKey != 0){
            if(viewModel.isSaved()){
                viewModel.deleteTeam()
                FavIcon.image = UIImage(systemName: "heart")
            }
            else {
                viewModel.addTeam()
                FavIcon.image = UIImage(systemName: "heart.fill")
            }
        }
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
extension ClubInfoViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.team.players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        cell.initializeCell(viewModel.team.players?[indexPath.item] ?? Player(playerKey: 9, playerName: "", playerImage: "") )
        
        return  cell
    }
    
    
}
