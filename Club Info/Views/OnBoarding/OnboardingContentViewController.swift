//
//  OnboardingContentViewController.swift
//  Club Info
//
//  Created by ammar on 19/05/2023.
//

import UIKit

class OnboardingContentViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    var controller :UINavigationController!

    var currentPage=0{
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count-1 {
                nextButton.setTitle("Get Started", for: .normal)
                }
            else{
                nextButton.setTitle("Next", for: .normal)
                
            }
        }
    }
    
    var slides:[OnBoardingSilde]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = (storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController)
        
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
       
       
        slides.append(OnBoardingSilde(tille: "Leagues",description: "view leagues and players and add them to favorite ",image:UIImage(named:"PL")!))
                      
        slides.append(OnBoardingSilde(tille: "last update",description: "get upcoming events and result ",image:UIImage(named:"lastUpdate")!))
                      
        slides.append(OnBoardingSilde(tille: "Favorite",description: "add player and leagues to favorite",image:UIImage(named:"Fav")!))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        let useTouchID = defaults.bool(forKey: "UseTouchID")

        if(useTouchID){
            present(controller, animated: false)
        }
        else{
            defaults.set(true, forKey: "UseTouchID")
            print("no")

        }
    }
    
    @IBAction func nextView(_ sender: Any) {
        if currentPage == slides.count - 1 {
            present(controller, animated: true)
        }
        else {
            currentPage += 1
            let  indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
}
extension OnboardingContentViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setUp(slides[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-7, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width-7
        currentPage = Int(scrollView.contentOffset.x / width )
        print(currentPage)
        pageControl.currentPage=currentPage
    }
}
