//
//  WAppSearchRouter.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Routing
protocol WAppSearchRoutingLogic {
    //func routeToWeather()
}


class WAppSearchRouter: NSObject, WAppSearchRoutingLogic, WAppSearchDataPassing {
    //MARK: - Properties
    weak var viewController: WAppSearchViewController?
    var dataStore: WAppSearchDataStore?
    
    
    //MARK: - Routing
    //Navigation Forward
//    func routeToWeather() {
//        let storyboard = UIStoryboard(name: "WApp", bundle: nil)
//        guard
//            let viewController = viewController,
//            let homeDS = dataStore,
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppViewController") as? WAppViewController,
//            var destinationDS = destinationVC.router?.dataStore else { print("NAVIGATION FAIL"); return }
//
//        navigateToWeather(source: viewController, destination: destinationVC)
//        passDataToWeather(source: homeDS, destination: &destinationDS)
//    }
    
    
    //MARK: - Navigation
//    private func navigateToWeather(source: WAppSearchViewController, destination: WAppViewController) {
//        source.dismiss(animated: true, completion: nil)
//    }
     
    
    //MARK: - PassingData
//    private func passDataToWeather(source: WAppSearchDataStore, destination: inout WAppDataStore) {
//        //destination.dataStore = source.dataStore
//    }
    
}//
