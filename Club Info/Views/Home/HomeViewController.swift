//
//  HomeViewController.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberOFItem = 4
    let arr = ["Football","BasketBall","Cricket","Tennis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Generate or fetch the data for the collection view
        
    }
    
    // Implement the data source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOFItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)
        
        
        //
        //            (cell.viewWithTag(1) as! UIImageView).image=UIImage(named: "Fav")
        
        (cell.viewWithTag(2) as! UILabel).text=arr[indexPath.item]
        
        
        return cell
    }
    
    // Implement the delegate method to set the size of each cell dynamically
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width) / 2
        
        let height = Int(collectionView.frame.height) / 2
        
        return CGSize(width: width , height: height )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        switch (indexPath.item){
        case 0:
            secondViewController.type=HomeType.Football
            break
        case 1:
            secondViewController.type=HomeType.BasketBall
            break
        case 2:
            secondViewController.type=HomeType.Cricket
            break
        case 3:
            secondViewController.type=HomeType.Tennis
            break
        default:
            break
        }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // Other methods and logic
}
