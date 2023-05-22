//
//  OnBoardingCollectionViewCell.swift
//  Club Info
//
//  Created by ammar on 21/05/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    


    @IBOutlet weak var dec: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    func setUp(_ slide:OnBoardingSilde){
        self.image.image=slide.image
        self.title.text=slide.tille
        self.dec.text=slide.description
    }
    
}
