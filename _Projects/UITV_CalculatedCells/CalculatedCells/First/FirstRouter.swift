//
//  FirstRouter.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol FirstRouterLogic: class {
    func routeToSingle()
}

//MARK: - Router
class FirstRouter: FirstRouterDependencies, FirstRouterLogic {
    
    //MARK: - Properties
    weak var view: FirstViewController?
    
    //MARK: - Route
    func routeToSingle() {
        let destinationVC = SingleViewController(nibName: "SingleViewController", bundle: nil)
        view?.navigationController?.pushViewController(destinationVC, animated: true)
    }

//    let destinationVC = DestinationViewController(nibName: "DestinationViewController", bundle: nil)
//    guard let sourceDS = view?.dataStore,
//          var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
//    passDataTo(source: sourceDS, destination: &destinationDS)
//    view?.navigationController?.pushViewController(destinationVC, animated: true)
    
    //MARK: - Passing Data
//    private func passDataTo(source: FirstDataStore, destination: inout DestinationDataStore) {
//        destination.data = source.data
//    }
}
