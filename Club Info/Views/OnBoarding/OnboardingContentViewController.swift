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
        let defaults = UserDefaults.standard
        
        

        
        slides.append(OnBoardingSilde(tille: "test 1",description: "test",image:UIImage(named:"test")!))
                      
        slides.append(OnBoardingSilde(tille: "test 2",description: "test",image:UIImage(named:"test")!))
                      
        slides.append(OnBoardingSilde(tille: "test3",description: "test",image:UIImage(named:"test")!))
        
    }
    
    @IBAction func nextView(_ sender: Any) {
        if currentPage == slides.count - 1 {
            print("next")
            
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
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width )
        pageControl.currentPage=currentPage
    }
}
