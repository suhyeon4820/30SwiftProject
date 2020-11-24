//
//  CollectionViewCell.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let chickeName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    private let chickenImage: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(chickeName)
        contentView.addSubview(chickenImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chickenImage.frame = CGRect(x: 5, y: 5,
                                    width: contentView.frame.size.width-10,
                                    height: contentView.frame.size.height-5-50)
        chickeName.frame = CGRect(x: 5, y: contentView.frame.size.height-50,
                                    width: contentView.frame.size.width-10,
                                    height: 50)
    }
    
    public func configure(with model: CollectionTableCellModel) {
        chickeName.text = model.chickenName
        chickenImage.image = UIImage(named: model.chickenImage)
        chickenImage.contentMode = .scaleAspectFit
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
