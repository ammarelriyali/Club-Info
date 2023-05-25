//
//  LeagueViewController.swift
//  Club Info
//
//  Created by ammar on 25/05/2023.
//

import UIKit

class LeagueViewController: UIViewController {

    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the layout
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            return self.createSectionLayout(sectionIndex)
        }
        
        // Create the collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        // Configure other properties of the collection view
        
        view.addSubview(collectionView)
    }
    
    private func createSectionLayout(_ sectionIndex: Int) -> NSCollectionLayoutSection {
        // Define item size and spacing
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // Define group size and layout
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
        
        // Create section layout
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

extension LeagueViewController: UICollectionViewDataSource ,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    // Implement UICollectionViewDataSource methods
}
