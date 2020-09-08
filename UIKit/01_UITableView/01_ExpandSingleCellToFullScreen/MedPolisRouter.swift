//
//  MedPolisRouter.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Routing

protocol MedPolisRoutingLogic {
    func routeToMain()
}

//MARK: - Protocol. Data passing

protocol MedPolisDataPassing {
    var dataStore: MedPolisDataStore? { get set }
}


class MedPolisRouter: NSObject, MedPolisRoutingLogic, MedPolisDataPassing {
    //MARK: - Properties
    
    weak var viewController: MedPolisViewController?
    var dataStore: MedPolisDataStore?
    
    
    //MARK: - Routing
    
    //Navigation Forward
    func routeToMain() {
        let storyboard = UIStoryboard(name: "MedMain", bundle: nil)
        guard
            let viewController = viewController,
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "MedMainViewController") as? MedMainViewController else { fatalError("NAVIGATION FAIL") }
        navigateToMain(source: viewController, destination: destinationVC)
    }
    
//    //Navigation Backward
//    func routeTo() {
//        guard
//            let viewController = viewController,
//            //let homeDS = dataStore,
//            let destinationVC = viewController.navigationController?.viewControllers.dropLast().last as? UIViewController else { fatalError("NAVIGATION FAIL") }
//            //var destinationDS = destinationVC.router?.dataStore else { fatalError("NAVIGATION FAIL") }
//
//        navigateTo(source: viewController, destination: destinationVC)
//        //passDataTo(source: homeDS, destination: &destinationDS)
//    }
    
    
    //MARK: - Navigation
    
    private func navigateToMain(source: MedPolisViewController, destination: MedMainViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
     
    
    //MARK: - Passing data
    
    
}//Class end
