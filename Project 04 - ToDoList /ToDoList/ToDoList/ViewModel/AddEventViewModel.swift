//
//  AddEventViewModel.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import Foundation

final class AddEventViewModel {
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    // coordinator와 연결하기 위해 필요
    var coordinator: AddEventCoordinator?
    
    // cell
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        
    }
    private(set) var cells: [AddEventViewModel.Cell] = []

    
    // 위의 cell과 연결
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    // tapped button
    func tappedDone() {
        guard let name = nameCellViewModel?.subtitle
    }
}
