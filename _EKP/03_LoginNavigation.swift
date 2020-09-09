//
//  MedStartRouter.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 14.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Routing

protocol MedStartRoutingLogic {
    func routeToPolis()
    func routeToMain()
    func routeToAuthorization()
}

//MARK: - Protocol. Data passing

protocol MedStartDataPassing {
    var dataStore: MedStartDataStore? { get set }
}


class MedStartRouter: NSObject, MedStartRoutingLogic, MedStartDataPassing {
    //MARK: - Properties
    
    weak var viewController: MedStartViewController?
    var dataStore: MedStartDataStore?
    
    
    //MARK: - Routing
    
    //Navigation Forward
    func routeToPolis() {
        let storyboard = UIStoryboard(name: "MedPolis", bundle: nil)
        guard
            let viewController = viewController,
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "MedPolisViewController")
                as? MedPolisViewController else { fatalError("NAVIGATION FAIL") }
        navigateToPolis(source: viewController, destination: destinationVC)
    }
    
    //Navigation Forward
    func routeToMain() {
        let storyboard = UIStoryboard(name: "MedMain", bundle: nil)
        guard
            let viewController = viewController,
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "MedMainViewController") as? MedMainViewController else { fatalError("NAVIGATION FAIL") }
        navigateToMain(source: viewController, destination: destinationVC)
    }
    
    //Navigation To Authorization
    func routeToAuthorization() {
        let isPinSetted = UserDefaults.standard.bool(forKey: Constants.PIN_ADDED)
        
        switch isPinSetted {
        case true:
            //Navigation To Authorization
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "LoginWithPinController") as? LoginWithPinController else { fatalError("NAVIGATION FAIL") }
            destinationVC.isFromDigitalHealth = true
            navigateToAuthorizationWithPin(source: viewController, destination: destinationVC)
            
        case false:
            //Navigation To Authorization With Pin
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? LoginViewController else { fatalError("NAVIGATION FAIL") }
            destinationVC.isFromDigitalHealth = true
            navigateToAuthorization(source: viewController, destination: destinationVC)
        }
    }
    
    
    //MARK: - Navigation
    
    private func navigateToPolis(source: MedStartViewController, destination: MedPolisViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
    
    private func navigateToMain(source: MedStartViewController, destination: MedMainViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
    
    private func navigateToAuthorization(source: MedStartViewController, destination: LoginViewController) {
        //Navigation To Authorization
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
    
    private func navigateToAuthorizationWithPin(source: MedStartViewController, destination: LoginWithPinController) {
        //Navigation To Authorization With Pin
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
     
    
    //MARK: - Passing data

    
}//Class end
