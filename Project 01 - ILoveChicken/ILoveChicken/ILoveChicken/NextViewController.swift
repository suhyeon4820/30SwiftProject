//
//  NextViewController.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/23.
//

import UIKit

class NextViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var textChicken: String? = ""
    var imageChicken: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 제목
        self.navigationItem.title = "\(String(describing: textChicken!))"
        
        imageView.image = UIImage(named: String(imageChicken!))
        textLabel.text = "\(textChicken!)" + " 치킨"
        
        // button
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 5
    }
    
}
