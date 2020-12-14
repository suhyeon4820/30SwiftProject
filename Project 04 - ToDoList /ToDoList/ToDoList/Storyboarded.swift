//
//  Storyboarded.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import UIKit

// 스토리보드에 접근해 자신의 타입 이름을 identifier로 가진 뷰컨트롤러를 반환해주는 함수

extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
