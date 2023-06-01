//
//  PlayerTableViewCell.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var imagePlayer: UIImageView!
    
    @IBOutlet weak var namePlayer: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imagePlayer.roundedImage()
        imagePlayer.borderImage()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initializeCell(_ player:Player){
        imagePlayer.sd_setImage(with: URL(string: player.playerImage ??  ""),placeholderImage: UIImage(named: "lastUpdate"))
        
        namePlayer.text=player.playerName
    }
    func initializeCellTeam(_ team:Team){
        
        imagePlayer.sd_setImage(with: URL(string: team.teamLogo ??  ""),placeholderImage: UIImage(named: "lastUpdate"))
        
        namePlayer.text = team.teamName
        
    }
    
}
