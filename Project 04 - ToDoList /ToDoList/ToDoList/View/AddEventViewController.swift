//
//  EventListViewController.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews() // 화면 구성 + 테이블 뷰
    }
    

    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        
        //navigation bar
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }
    
    @objc private func tappedDone() {
        viewModel.tappedDone()
    }
}

// Tableview
extension AddEventViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cellViewModel = viewModel.cell(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
        //∫cell.update(with: titleSubtitleCellViewModel)
        cell.textLabel?.text = "hello"
        return cell
        //        switch cellViewModel {
        //        case .titleSubtitle(let titleSubtitleCellViewModel):
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
//            cell.update(with: titleSubtitleCellViewModel)
//            cell.textLabel?.text = "hello"
//            return cell
//        }
    }
    
}
