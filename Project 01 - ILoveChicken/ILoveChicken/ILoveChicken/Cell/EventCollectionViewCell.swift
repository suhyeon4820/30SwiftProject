//
//  EventCollectionViewCell.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/24.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "EventCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EventCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = UIImage(named: "event")
        imageView.contentMode = .scaleAspectFit
    }

}
