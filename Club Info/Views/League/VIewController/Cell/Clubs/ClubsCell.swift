//
//  ClubsCell.swift
//  Club Info
//
//  Created by ammar on 28/05/2023.
//

import UIKit

class ClubsCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image.roundedImage()
        
        
    }
    func initializeCell(_ imageURL:String){
        
        image.sd_setImage(with: URL(string: imageURL),placeholderImage: UIImage(named: "lastUpdate"))
        
    }

}
