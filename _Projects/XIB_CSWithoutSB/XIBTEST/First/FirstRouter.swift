//
//  FirstRouter.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol FirstRouterLogic: class {
    func routeToSecond()
}

//MARK: - Router
class FirstRouter: FirstRouterDependencies, FirstRouterLogic {
    
    //MARK: - Properties
    weak var view: FirstViewController?
    
    //MARK: - Route
    func routeToSecond() {
        let destinationVC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        guard let sourceDS = view?.dataStore,
              var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
        passDataToSecond(source: sourceDS, destination: &destinationDS)
        view?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
//    guard let sourceVC = view,
//          let sourceDS = view?.dataStore,
//          let destinationVC = UIStoryboard(name: "Second", bundle: nil)
//            .instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController,
//          var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
//    passDataTo(source: sourceDS, destination: &destinationDS)
//    sourceVC.navigationController?.pushViewController(destinationVC, animated: true)
    
    //MARK: - Passing Data
    private func passDataToSecond(source: FirstDataStore, destination: inout SecondDataStore) {
        destination.selectedNum = source.nums.randomElement()
    }
}
