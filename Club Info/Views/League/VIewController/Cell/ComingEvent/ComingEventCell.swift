//
//  ComingEventCell.swift
//  Club Info
//
//  Created by ammar on 28/05/2023.
//

import UIKit

class ComingEventCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var imageFirstClub: UIImageView!
    @IBOutlet weak var nameFirstClub: UILabel!
    @IBOutlet weak var timeMatch: UILabel!
    @IBOutlet weak var nameSecondClub: UILabel!
    @IBOutlet weak var imageSecondClub: UIImageView!
    @IBOutlet weak var dateOfMatch: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.clipsToBounds = true
        background.layer.cornerRadius = background.frame.height / 10
        
        imageFirstClub.roundedImage()
        
        imageSecondClub.roundedImage()
        
        
    }
    func initializeCell(_ event:Event,Image name:String){
        
        imageFirstClub.sd_setImage(with: URL(string: event.homeTeamLogo ?? ""),placeholderImage: UIImage(named: name))
        nameFirstClub.text = event.eventHomeTeam
        timeMatch.text = event.eventTime
        nameSecondClub.text = event.eventAwayTeam
        imageSecondClub.sd_setImage(with: URL(string: event.awayTeamLogo ?? ""),placeholderImage: UIImage(named:  name))
        dateOfMatch.text = event.eventDate
        
    }

}
