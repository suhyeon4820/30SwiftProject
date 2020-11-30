//
//  ViewController.swift
//  StopWatch
//
//  Created by 정수현 on 2020/11/29.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var buttonClicked: Int = 0
    
    // MARK: - UIOulets
    private let timeTextLabel: UILabel = {
        let timeLable = UILabel()
        timeLable.text = "00:00:00"
        timeLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        timeLable.font = UIFont.boldSystemFont(ofSize: 45)
        return timeLable
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let lapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lap", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let stopLabel1: UILabel = {
        let lable = UILabel()
        lable.text = "00:00:00"
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        return lable
    }()
    
    private let stopLabel2: UILabel = {
        let lable = UILabel()
        lable.text = "00:00:00"
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        return lable
    }()
    
    private let stopLabel3: UILabel = {
        let lable = UILabel()
        lable.text = "00:00:00"
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        return lable
    }()
    
    private let stopLabel4: UILabel = {
        let lable = UILabel()
        lable.text = "00:00:00"
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        return lable
    }()
    
    private let stopLabel5: UILabel = {
        let lable = UILabel()
        lable.text = "00:00:00"
        lable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        return lable
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let horizLine1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    private let horizLine2: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    private let         horizLine3: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    private let         horizLine4: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    private let         horizLine5: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        lapButton.addTarget(self, action: #selector(didTapLapButton), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(didTapRestButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let w: CGFloat = 80;  let h: CGFloat = 55
        timeTextLabel.frame = CGRect(x: 63, y: 30, width: view.frame.size.width, height: 100)
        startButton.frame = CGRect(x: 10, y: view.frame.size.height/4,
                                   width: view.frame.size.width/2-15, height: 40)
        lapButton.frame = CGRect(x: view.frame.size.width/2+5, y: view.frame.size.height/4,
                                 width: view.frame.size.width/2-15, height: 40)
        stopLabel1.frame = CGRect(x: w+30, y: view.frame.size.height/4 + h, width: view.frame.size.width/3, height: h)
        stopLabel2.frame = CGRect(x: w+30, y: view.frame.size.height/4 + 2*h, width: view.frame.size.width/3, height: h)
        stopLabel3.frame = CGRect(x: w+30, y: view.frame.size.height/4 + 3*h, width: view.frame.size.width/3, height: h)
        stopLabel4.frame = CGRect(x: w+30, y: view.frame.size.height/4 + 4*h, width: view.frame.size.width/3, height: h)
        stopLabel5.frame = CGRect(x: w+30, y: view.frame.size.height/4 + 5*h, width: view.frame.size.width/3, height: h)
        horizLine1.frame = CGRect(x: w, y: view.frame.size.height/4 + 2*h-10, width: view.frame.size.width/2, height: 1)
        horizLine2.frame = CGRect(x: w, y: view.frame.size.height/4 + 3*h-10, width: view.frame.size.width/2, height: 1)
        horizLine3.frame = CGRect(x: w, y: view.frame.size.height/4 + 4*h-10, width: view.frame.size.width/2, height: 1)
        horizLine4.frame = CGRect(x: w, y: view.frame.size.height/4 + 5*h-10, width: view.frame.size.width/2, height: 1)
        horizLine5.frame = CGRect(x: w, y: view.frame.size.height/4 + 6*h-10, width: view.frame.size.width/2, height: 1)
        resetButton.frame = CGRect(x: 10, y: view.frame.size.height/4 + 6*h+30 , width: view.frame.size.width-20, height: 40)
    }
    
    private func addSubviews() {
        view.addSubview(timeTextLabel)
        view.addSubview(startButton); view.addSubview(lapButton)
        view.addSubview(stopLabel1); view.addSubview(horizLine1);
        view.addSubview(stopLabel2); view.addSubview(horizLine2)
        view.addSubview(stopLabel3); view.addSubview(horizLine3)
        view.addSubview(stopLabel4); view.addSubview(horizLine4)
        view.addSubview(stopLabel5); view.addSubview(horizLine5)
        view.addSubview(resetButton)
    }
    
    // MARK: - Button Action Functions
    @objc private func didTapStartButton(_sender: Any) {
        if timerCounting {
            timerCounting = false
            timer.invalidate()
            startButton.setTitle("Start", for: .normal)
            startButton.backgroundColor = .systemBlue
        } else {
            timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
            startButton.setTitle("Pause", for: .normal)
            startButton.backgroundColor = .systemPink
        }
    }
    
    @objc private func didTapLapButton(sender: UIButton) {
        if sender.isSelected {
        } else {
            buttonClicked += 1
            if buttonClicked % 5 == 0 {
                buttonClicked = 5
            } else {
                buttonClicked = buttonClicked % 5
            }
        }
        switch buttonClicked {
        case 1:
            stopLabel1.text = timeCounter(); stopLabel1.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 2:
            stopLabel2.text = timeCounter(); stopLabel2.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 3:
            stopLabel3.text = timeCounter(); stopLabel3.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 4:
            stopLabel4.text = timeCounter(); stopLabel4.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 5:
            stopLabel5.text = timeCounter(); stopLabel5.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        default:
            print("Button not Clicked")
        }
    }
    
    @objc private func didTapRestButton(_sender: Any) {
        timerCounting = false
        count = 0
        buttonClicked = 0
        timer.invalidate()
        // Start Button
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .systemBlue
        // Setup
        self.timeTextLabel.text = "00:00:00"
        stopLabel1.text = "00:00:00"; stopLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stopLabel2.text = "00:00:00"; stopLabel2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stopLabel3.text = "00:00:00"; stopLabel3.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stopLabel4.text = "00:00:00"; stopLabel4.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stopLabel5.text = "00:00:00"; stopLabel5.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc private func timeCounter() -> String {
        count += 1
        let minute = Int(((count % 3600)/60)/60)
        let second = Int((count % 3600)/60)
        let miliSecond = Int(count % 60)
        let timeLable = String(format: "%02d:%02d:%02d", minute, second, miliSecond)
        self.timeTextLabel.text = timeLable
        return timeLable
    }

}

