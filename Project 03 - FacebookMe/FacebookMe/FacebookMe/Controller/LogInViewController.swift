//
//  LogInViewController.swift
//  FacebookMe
//
//  Created by 정수현 on 2020/12/06.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
        emailTF.keyboardType = .emailAddress
        emailTF.becomeFirstResponder() // 첫 번째로 작동, 종료 : resignFirstResponder()

        // design
        emailTF.tfUnderLine()
        passwordTF.tfUnderLine()
        logInButton.buttonDesign()
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.backgroundColor = .yellow
    }
    
    @objc func logInButtonTapped() {
        //let vc = UINavigationController(rootViewController: MainViewController())
        let vc = storyboard?.instantiateViewController(identifier: "MainVC1") as! NaviViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension UITextField {
    func tfUnderLine() {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.size.width, height: 1)
        if self.isSelected == true {
            border.borderColor = #colorLiteral(red: 0.2196078431, green: 0.462745098, blue: 0.9333333333, alpha: 1)
            border.borderWidth = width
            self.layer.addSublayer(border)
        } else {
            border.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            border.borderWidth = width
            self.layer.addSublayer(border)
        }
    }
}

extension UIButton {
    func buttonDesign() {
        self.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.462745098, blue: 0.9333333333, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
