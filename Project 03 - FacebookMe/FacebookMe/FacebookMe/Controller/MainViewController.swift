//
//  MainViewController.swift
//  FacebookMe
//
//  Created by 정수현 on 2020/12/06.
// 참고영상 : youtube.com/watch?v=F-L_AiAZ6ME
// tablebview expendable : https://www.youtube.com/watch?v=Q8k9E1gQ_qg
// custom cell : https://www.youtube.com/watch?v=rRhJGnSmEKQ

import UIKit

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
//        //create a new button
//        let button = UIButton(type: .custom)
//        //set image for button
//        button.setImage(UIImage(named: "facebook.png"), for: .normal)
//
//        //set frame
//        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
//
//        let barButton = UIBarButtonItem(customView: button)
//        //assign button to navigationbar
//        self.navigationItem.rightBarButtonItem = barButton
        
        navigationController?.navigationBar.isTranslucent = false
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titleLable.text = "home"
        navigationItem.titleView = titleLable
        
        setupMenuBar()
        viewDidLayoutSubviews()
    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
    }
    
    

    private func setupMenuBar() {
        view.addSubview(menuBar)
    }
    
//    private let logoImage: UIBarButtonItem = {
//        let item = UIBarButtonItem()
//        let image = UIImage(named: "facebook.png")
//        item.setBackgroundImage(image, for: .normal, barMetrics: .default)
//        return item
//    }()
//
//    func addLogoImage() {
//        let image = UIImage(named: "facebook.png")
//        let imageView = UIImageView(image: image)
//        imageView.contentMode = .scaleAspectFit
//        navigationItem.titleView = imageView
//    }

}
