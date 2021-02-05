//
//  MutiCellsRouter.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol MutiCellsRouterLogic: class {
    func routeTo()
}

//MARK: - Router
class MutiCellsRouter: MutiCellsRouterDependencies, MutiCellsRouterLogic {
    
    //MARK: - Properties
    weak var view: MutiCellsViewController?
    
    //MARK: - Route
    func routeTo() { }

//    let destinationVC = DestinationViewController(nibName: "DestinationViewController", bundle: nil)
//    guard let sourceDS = view?.dataStore,
//          var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
//    passDataTo(source: sourceDS, destination: &destinationDS)
//    view?.navigationController?.pushViewController(destinationVC, animated: true)
    
    //MARK: - Passing Data
//    private func passDataTo(source: MutiCellsDataStore, destination: inout DestinationDataStore) {
//        destination.data = source.data
//    }
}
