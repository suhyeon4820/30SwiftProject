//
//  AppCoordinator.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import UIKit

// Coordinator Protocol 생성
protocol Coordinator: class {
    // childCoordinator를 가지고있을 배열
    var childCoordinators: [Coordinator] { get }
    // 네비게이션을 담을 변수
    var navigationController: UINavigationController { get }

    // 시작시 실행될 함수
    func start()
}

// Coordinator Protocol 채택해 class 생성
// final type : 메소드, 프로퍼티, 서브스크립트가 오버라이드 금지 (주로 재정의할 필요가 없을 때 사용)
final class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    // 제일 첫 화면
    func start() {
        // 처음에 보여질 화면의 Coordinator : eventListCoordinator
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        // childCoordinators에 저장
        childCoordinators.append(addEventCoordinator)
        // childCoordinators start 함수 실행
        addEventCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible() // 윈도우를 새로 만든 경우 화면에 보여주기위해 꼭 호출하는 함수
    
        //print(childCoordinators) //[ToDoList.AddEventCoordinator]
    }
}
