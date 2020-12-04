//
//  WAppSearchRouter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


class WAppSearchRouter: WAppSearchRouterProtocol {
    //MARK: - Properties
    weak var viewController: WAppSearchViewController?
    var dataStore: WAppSearchDataStoreProtocol?
    
    
    //MARK: - Route
    func routeToView(view: WAppSearch.Route) { }
    
//Navigation Forward
//    func routeTo() {
//        let storyboard = UIStoryboard(name: "_____", bundle: nil)
//        guard let viewController = viewController,
//            //let homeDS = dataStore,
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "_____")
//              as? UIViewController else { print("===== NAVIGATION FAIL"); return }
//            //var destinationDS = destinationVC.router?.dataStore else { print("===== ===== NAVIGATION FAIL"); return }
//
//        navigateTo(source: viewController, destination: destinationVC)
//        //passDataTo(source: homeDS, destination: &destinationDS)
   
    
    //MARK: - Navigation
//    private func navigateTo(source: WAppSearchViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
     
    
    //MARK: - PassingData
//    //Pass Data in Navigation Stack
//    private func passDataTo(source: WAppSearchDataStore, destination: inout DestinationDataStore) {
//        destination.dataStore = source.dataStore
//    }
}//
