//
//  WAppSearchRouter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


class WAppSearchRouter: WAppSearchRouterProtocol, WAppSearchRouterLogicProtocol {
    //MARK: - Properties
    weak var viewController: WAppSearchViewController?
    var dataStore: WAppSearchDataStoreProtocol?
    
    
    //MARK: - Route
    func routeTo(routeType: WAppSearch.Route) { }
   
    
    //MARK: - Navigation
//    private func navigateTo(source: WAppSearchViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
     
    
    //MARK: - Passing Data
//    //Pass Data in Navigation Stack
//    private func passDataTo(source: WAppSearchDataStore, destination: inout DestinationDataStore) {
//        destination.dataStore = source.dataStore
//    }
}//
