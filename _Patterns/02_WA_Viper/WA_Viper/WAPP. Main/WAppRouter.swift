//
//  WAppRouter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppRouter: WAppRouterProtocol {
    //MARK: - Properties
    weak var viewController: WAppViewController?
    var dataStore: WAppDataStoreProtocol?
    
    
    //MARK: - Route
    func routeToView(routeType: WApp.Route) {
        switch routeType {
        case .routeToSearch:
            let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
            guard let viewController = viewController,
                  let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppSearchViewController")
                    as? WAppSearchViewController else { print("===== NAVIGATION FAIL"); return }
            navigateToSearch(source: viewController, destination: destinationVC)
        }
    }

    
    //MARK: - Navigation
    private func navigateToSearch(source: WAppViewController, destination: WAppSearchViewController) {
        source.navigationController?.present(destination, animated: true, completion: nil)
    }
     
    
    //MARK: - PassingData
}//
