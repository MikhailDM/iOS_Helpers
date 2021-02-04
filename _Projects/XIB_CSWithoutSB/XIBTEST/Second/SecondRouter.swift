//
//  SecondRouter.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol SecondRouterLogic: class {
    func routeBack()
}

//MARK: - Router
class SecondRouter: SecondRouterDependencies, SecondRouterLogic {
    
    //MARK: - Properties
    weak var view: SecondViewController?
    
    //MARK: - Route
    func routeBack() {
        guard let sourceDS = view?.dataStore,
              let destinationVC = view?.navigationController?.viewControllers.dropLast().last as? FirstViewController,
              var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
        passDataBack(source: sourceDS, destination: &destinationDS)
        view?.navigationController?.popViewController(animated: true)
    }
    
//    guard let sourceVC = view,
//          let sourceDS = view?.dataStore,
//          let destinationVC = UIStoryboard(name: "Second", bundle: nil)
//            .instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController,
//          var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
//    passDataTo(source: sourceDS, destination: &destinationDS)
//    sourceVC.navigationController?.pushViewController(destinationVC, animated: true)
    
    //MARK: - Passing Data
    private func passDataBack(source: SecondDataStore, destination: inout FirstDataStore) {
        destination.selectedNum = source.nums.randomElement()
    }
}
