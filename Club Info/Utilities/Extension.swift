//
//  Extension.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//


import UIKit
extension UIImageView{
    func roundedImage(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
