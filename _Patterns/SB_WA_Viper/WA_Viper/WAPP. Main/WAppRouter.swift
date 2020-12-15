//
//  WAppRouter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//

import UIKit
import RxSwift

class WAppRouter: WAppRouterProtocol, WAppRouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: WAppViewController?
    private var disposeBag = DisposeBag()
    
    //MARK: - Route
    func routeTo(routeType: WApp.Route) {
        switch routeType {
        case .routeToSearch:
            let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
            guard let viewController = view,
                  let homeDS = view?.presenter?.dataStore,
                  let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppSearchViewController")
                    as? WAppSearchViewController,
                  var destinationDS = destinationVC.presenter?.dataStore else { print("===== NAVIGATION FAIL"); return }
            navigateToSearch(source: viewController, destination: destinationVC)
            subscribeToSelectedCity(source: homeDS, destination: &destinationDS)
        }
    }

    //MARK: - Navigation
    private func navigateToSearch(source: WAppViewController, destination: WAppSearchViewController) {
        source.navigationController?.present(destination, animated: true, completion: nil)
    }
     
    //MARK: - Passing Data
    private func subscribeToSelectedCity(source: WApp.DataStore, destination: inout WAppSearch.DataStore) {
        destination.selectedCity.asObserver()
            .debug("===== SELECT CITY")
            .subscribe(onNext: { [weak self] city in
                self?.view?.presenter?.presenterRequest(requestType: .updateCity(city: city))
            }).disposed(by: disposeBag)
    }
    
}//
