//
//  EventViewController.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/24.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // cell register
        collectionView.register(EventCollectionViewCell.nib(), forCellWithReuseIdentifier: EventCollectionViewCell.identifier)

        // collectionview layout
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
    }
}

extension EventViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as! EventCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width,
                      height: (self.collectionView.frame.size.width)*8+400)
    }


}
