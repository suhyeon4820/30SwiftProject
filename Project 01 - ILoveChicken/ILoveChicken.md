## ILoveChicken

#### 1. 화면 전환

- `UITabBarController`를 이용해 메뉴페이지와 이벤트 화면 두 화면으로 구성
  - Menu 화면 : 메뉴 소개 페이지는 *UITableView*를 이용해 상단에 *UICollectionView*를 추가
  - Event 화면 : 긴 화면의 이미지 정보를 *UICollectionView*로 화면에 표시
- `NavigationController` 를 활용해 메뉴페이지에서 다음 화면으로 이동 시 선택한 데이터를 전달받을 수 있도록 함

<img src = "image\01.png" width = "400" style = "float: left">



### 2. 페이지별 구현 내용

#### 2-1) 메뉴 페이지

- `UITableView`에서 TableCell과 CollectionCell 구현

  1. TableCell과 CollectionCell 구분

     - CollectionCell : **TableViewCell** 연결 설정, 테이블 행(1)값 return

     - TableCell과 : 테이블 행(models.count)값 + 테이블 값 입력

     ```swift
     // 모델을 list와 collection으로 구분해 행 값을 받음
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         switch models[section] {
         case .collectionView(_, _): return 1 
         case .list(let models): return models.count
         }
     }
         
     // 각 셀값을 정해줌 list 여기서 구현, collection은 TableViewCell에서 구현
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            cell.configure(with: models)
            return cell
         case .list(let models):
             let model = models[indexPath.row]
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
             cell.textLabel?.text = model.chickensName + model.emogie
             cell.imageView?.image = UIImage(named: model.chickensImage)
             return cell
         }
     }
     ```

     

  2. TableCell에서 UICollectionView를 구성

     - CollectionView를 설정한 다음 CollectionView의 Cell을 **CollectionViewCell**로 표시

     ```swift
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let model = models[indexPath.row]
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
         cell.configure(with: model)
         return cell
     }
     ```

     

  3. CollectionCell

     - 셀에 입력될 이미지뷰와 레이블 값 입력

<img src = "image\02.png" width= "600">

- 데이터 전달

#### 2-2) 이벤트 페이지

- UICollectionView를 이용 -> 추후 UIScrollView로 수정





