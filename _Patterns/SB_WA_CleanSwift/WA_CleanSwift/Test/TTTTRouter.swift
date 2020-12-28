//
//  TTTTRouter.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//

import UIKit

//MARK: - Router
class TTTTRouter: TTTTRouterProtocol, TTTTRouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: TTTTViewController?
    
    //MARK: - Route
    func routeTo(routeType: TTTTLogic.Route) { }
    
//    let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
//    guard let viewController = view,
//          let homeDS = view?.interactor?.dataStore,
//          let destinationVC = storyboard.instantiateViewController(withIdentifier: "UIViewController") as? UIViewController,
//          var destinationDS = destinationVC.interactor?.dataStore else { print("===== NAVIGATION FAIL"); return }
//    navigateTo(source: viewController, destination: destinationVC)
//    passDataTo(source: homeDS, destination: &destinationDS)
    
    //MARK: - Navigation
//    private func navigateTo(source: TTTTViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
    
    //MARK: - Passing Data
//    private func passDataTo(source: TTTTLogic.DataStore, destination: inout Destination.DataStore) {
//        destination.dataStore = source.dataStore
//    }
    
}//
