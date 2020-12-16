//
//  TYJRRouter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 15.12.2020
//

import UIKit

class TYJRRouter: TYJRRouterProtocol, TYJRRouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: TYJRViewController?
    
    //MARK: - Route
    func routeTo(routeType: TYJR.Route) { }
    
//    let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
//    guard let viewController = view,
//          let homeDS = view?.presenter?.dataStore,
//          let destinationVC = storyboard.instantiateViewController(withIdentifier: "UIViewController") as? UIViewController,
//          var destinationDS = destinationVC.presenter?.dataStore else { print("===== NAVIGATION FAIL"); return }
//    navigateToSearch(source: viewController, destination: destinationVC)
//    subscribeToSelectedCity(source: homeDS, destination: &destinationDS)
    
    //MARK: - Navigation
//    private func navigateTo(source: TYJRViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
    
    //MARK: - Passing Data
//    private func passDataTo(source: TYJR.DataStore, destination: inout Destination.DataStore) {
//        destination.dataStore = source.dataStore
//    }
    
}//
