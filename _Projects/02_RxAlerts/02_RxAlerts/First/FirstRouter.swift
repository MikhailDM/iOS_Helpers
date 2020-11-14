//
//  FirstRouter.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Routing
protocol FirstRoutingLogic {
    func routeToSecond()
}


class FirstRouter: NSObject, FirstRoutingLogic, FirstDataPassing {
    //MARK: - Properties
    weak var viewController: FirstViewController?
    var dataStore: FirstDataStore?
    
    
    //MARK: - Routing
    //Navigation Forward
    func routeToSecond() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        guard
            let viewController = viewController,
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { fatalError("NAVIGATION FAIL") }
        navigateTo(source: viewController, destination: destinationVC)
    }
    
    
    //MARK: - Navigation
    private func navigateTo(source: FirstViewController, destination: SecondViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
     
    
    //MARK: - PassingData
    
}//
