//
//  WAppRouter.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//


import UIKit
import RxSwift


class WAppRouter: WAppRouterProtocol, WAppRouterLogicProtocol {
    //MARK: - Properties
    weak var view: WAppViewController?
    private var disposeBag = DisposeBag()
    
    
    //MARK: - Routing
    func routeTo(routeType: WApp.Route) {
        switch routeType {
        case .routeToSearch:
            let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
            guard let viewController = view,
                  let homeDS = viewController.interactor?.dataStore,
                  let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppSearchViewController")
                    as? WAppSearchViewController,
                  var destinationDS = destinationVC.interactor?.dataStore else { print("===== NAVIGATION FAIL"); return }
            navigateToSearch(source: viewController, destination: destinationVC)
            subscribeToSelectedCity(source: homeDS, destination: &destinationDS)
        }
    }
    
    
    //MARK: - Navigation
    private func navigateToSearch(source: WAppViewController, destination: WAppSearchViewController) {
        source.navigationController?.present(destination, animated: true, completion: nil)
    }
     
    
    //MARK: - Passing data
    private func subscribeToSelectedCity(source: WApp.DataStore, destination: inout WAppSearch.DataStore) {
        destination.selectedCity.asObserver()
            .debug("===== SELECT CITY")
            .subscribe(onNext: { [weak self] city in
                self?.view?.interactor?.interactorRequest(requestType: .requestWeatherByCity(cityName: city))
            }).disposed(by: disposeBag)
    }
}//
