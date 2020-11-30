//
//  WAppRouter.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift


//MARK: - Protocol. RoutingLogic
protocol WAppRoutingLogic {
    func routeToSearch() -> PublishSubject<String>
}


//MARK: - Protocol. DataPassing
protocol WAppDataPassing {
    var dataStore: WAppDataStore? { get set }
}


class WAppRouter: NSObject, WAppRoutingLogic, WAppDataPassing {
    //MARK: - Properties
    weak var viewController: WAppViewController?
    var dataStore: WAppDataStore?
    
    
    //MARK: - Routing
    func routeToSearch() -> PublishSubject<String> {
        let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
        guard
            let viewController = viewController,
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppSearchViewController")
                as? WAppSearchViewController,
            let destinationDS = destinationVC.router?.dataStore else { return PublishSubject<String>.create { (observer) -> Disposable in
                observer.onCompleted(); return Disposables.create() } as! PublishSubject<String> }
        navigateToSearch(source: viewController, destination: destinationVC)
        return destinationDS.selectedCity
    }
    
    
    //MARK: - Navigation
    private func navigateToSearch(source: WAppViewController, destination: WAppSearchViewController) {
        source.navigationController?.present(destination, animated: true, completion: nil)
    }
     
    
    //MARK: - Passing data
    
}//
