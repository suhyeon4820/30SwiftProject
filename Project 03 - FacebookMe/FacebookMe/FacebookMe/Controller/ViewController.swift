//
//  ViewController.swift
//  FacebookMe
//
//  Created by 정수현 on 2020/12/05.
// https://www.youtube.com/watch?v=yDxad7zWs4M

import UIKit

class ViewController: UIViewController {
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Eglish · Tiếng Việt · "
        label.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        return label
    }()
    
    private let languageButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기...", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2862745098, green: 0.4117647059, blue: 0.6588235294, alpha: 1), for: .normal)
        return button
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    //---------------------
//    private let emailTF: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = " "
//        return textField
//    }()
//
//    private let passwordTF: UITextField = {
//        let textField = UITextField()
//        return textField
//    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.462745098, blue: 0.9333333333, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를\n"+"잊으셨나요?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2196078431, green: 0.462745098, blue: 0.9333333333, alpha: 1)
        return label
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    private let grayLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return line
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("새 Facebook 계정 만들기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.6274509804, blue: 0.3254901961, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        viewDidLayoutSubviews()
        languageButton.addTarget(self, action: #selector(popUpLanguage), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        languageLabel.frame = CGRect(x: 100, y: 40, width: 150, height: 30)
        languageButton.frame = CGRect(x: 240, y: 40, width: 100, height: 30)
        logoImage.frame = CGRect(x: 170, y: 180, width: 80, height: 80)
        loginButton.frame = CGRect(x: 20, y: 530, width: view.frame.size.width-40, height: 52)
        passwordLabel.frame = CGRect(x: 110, y: 590, width: 200, height: 60)
        orLabel.frame = CGRect(x: 185, y: 685, width: 50, height: 30)
        grayLine.frame = CGRect(x: 20, y: 700, width: view.frame.size.width-40, height: 1)
        createAccountButton.frame = CGRect(x: 60, y: 750, width: view.frame.size.width-120, height: 52)
    }

    func addSubViews() {
        view.addSubview(languageLabel); view.addSubview(languageButton)
        view.addSubview(logoImage)
        view.addSubview(loginButton)
        view.addSubview(passwordLabel)
        view.addSubview(grayLine)
        view.addSubview(orLabel)
        view.addSubview(createAccountButton)
    }
    
    @objc func popUpLanguage() {
        let pop = Popup()
        view.addSubview(pop)
    }
    
    @objc func loginTapButton() {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LogInViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }

}

