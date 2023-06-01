//
//  HomeViewController.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import UIKit

class HomeViewController: UIViewController ,UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberOFItem = 4
    let arr = ["Football","BasketBall","Cricket","Tennis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        switch (indexPath.item){
        case 0:
            secondViewController.type=SportType.Football
            break
        case 1:
            secondViewController.type=SportType.BasketBall
            break
        case 2:
            secondViewController.type=SportType.Cricket
            break
        case 3:
            secondViewController.type=SportType.Tennis
            break
        default:
            break
        }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // Other methods and logic
}
extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
 
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = view.frame.width / 2 - (layout.minimumInteritemSpacing + 20)
        let itemHeight = view.frame.height / 3
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
