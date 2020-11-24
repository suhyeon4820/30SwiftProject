//
//  ViewController.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    private var models = [CellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableViewCell, CollectionView Cell 등록
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        // table 밑줄 제거
        table.separatorStyle = .none
        setUpModels()
        addLogoImage()
    }
    
    func addLogoImage() {
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func setUpModels() {
        models.append(.collectionView(models: [CollectionTableCellModel(chickenName: "크리스피", chickenImage: "크리스피"), CollectionTableCellModel(chickenName: "블랙페퍼", chickenImage: "블랙페퍼"), CollectionTableCellModel(chickenName: "찐킹소스", chickenImage: "찐킹소스"), CollectionTableCellModel(chickenName: "레드착착", chickenImage: "레드착착")], rows: 1))
        models.append(.list(models: [ListCellModel(chickensName: "크리스피", chickensImage: "크리스피", emogie: "🍗"),
            ListCellModel(chickensName: "블랙페퍼", chickensImage: "블랙페퍼", emogie: "🧂👍"),
            ListCellModel(chickensName: "찐킹소스", chickensImage: "찐킹소스", emogie: "🥫"),
            ListCellModel(chickensName: "레드착착", chickensImage: "레드착착", emogie: "🌶️")]))
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .list(let models): return models.count
        case .collectionView(_, _): return 1 //models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .list(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.chickensName + model.emogie
            cell.imageView?.image = UIImage(named: model.chickensImage)
            return cell
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            cell.configure(with: models)
            return cell
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch models[indexPath.section] {
        case .list(let models):
            let vc = self.storyboard?.instantiateViewController(identifier: "menuVC") as! NextViewController
            let model = models[indexPath.row]
            print(indexPath, "indexPath")
            print(model, "model")
            vc.textChicken = model.chickensName
            vc.imageChicken = model.chickensImage
            self.navigationController?.pushViewController(vc, animated: true)
        case .collectionView(models: _, rows: _):
            print("")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .list(_): return 90
        case .collectionView(_, let rows): return 170 * CGFloat(rows)
        }
    }
    


}


