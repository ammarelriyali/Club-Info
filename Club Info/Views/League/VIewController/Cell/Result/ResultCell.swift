//
//  ResultCell.swift
//  Club Info
//
//  Created by ammar on 28/05/2023.
//

import UIKit

class ResultCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var imageFirstClub: UIImageView!
    @IBOutlet weak var nameFirstClub: UILabel!
    @IBOutlet weak var timeMatch: UILabel!
    @IBOutlet weak var nameSecondClub: UILabel!
    @IBOutlet weak var imageSecondClub: UIImageView!
    @IBOutlet weak var dateOfMatch: UILabel!
    @IBOutlet weak var resultMatch: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
