//
//  TitleSubtitleCell.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import Foundation
import UIKit

final class TitleSubtitleCell: UITableViewCell {
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
    }
}
