//
//  EventListCoordinator.swift
//  ToDoList
//
//  Created by suhyeon on 2020/12/14.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // storyboard
        let AddEventController: AddEventViewController = .instantiate()
        
        // viewModel binding
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self //viewmodel에 coordinator 필요
        AddEventController.viewModel = addEventViewModel
        
        // coordinator Stack
        navigationController.setViewControllers([AddEventController], animated: false)
        //print(childCoordinators) []
    }
    
}
