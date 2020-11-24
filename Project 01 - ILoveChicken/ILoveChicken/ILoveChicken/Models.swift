//
//  Models.swift
//  ILoveChicken
//
//  Created by 정수현 on 2020/11/23.
//

import Foundation

enum CellModel {
    case collectionView(models: [CollectionTableCellModel], rows: Int)
    case list(models: [ListCellModel])
}
//enum CellModel {
//    case collectionView(models: [CollectionTableCellModel], rows: Int)
//    case list(models: [ListCellModel])
//}

struct ListCellModel {
    let chickensName: String
    let chickensImage: String
    let emogie: String
}

struct CollectionTableCellModel {
    let chickenName: String
    let chickenImage: String
}
