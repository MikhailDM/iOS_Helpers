//
//  WAppSearchSearchInteractor.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//

import UIKit

class WAppSearchInteractor: WAppSearchInteractorProtocol, WAppSearchInteractorLogicProtocol, WAppSearchDataStoreProtocol  {
    
    //MARK: - Properties
    var presenter: WAppSearchPresenterLogicProtocol?
    var router: WAppSearchRouterLogicProtocol?
    var dataStore: WAppSearch.DataStore?

    private var citiesList = CitiesManager().getAllCitiesName()
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: WAppSearch.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .getCitiesList:
            presenter?.presenterRequest(requestType: .presentCities(cities: citiesList))
            
        case .selectCity(city: let city):
            dataStore?.selectedCity.onNext(city)
            dataStore?.selectedCity.onCompleted()
            router?.routeTo(routeType: .dismissView)
            
        case .getCitiesWhichContainText(searchText: let searchText):
            guard searchText != "" else {
                presenter?.presenterRequest(requestType: .presentCities(cities: citiesList))
                return
            }
            let searchData = citiesList.filter { city -> Bool in
                return city.lowercased().contains(searchText.lowercased())
            }
            presenter?.presenterRequest(requestType: .presentCities(cities: searchData))
        
        case .dismissView:
            router?.routeTo(routeType: .dismissView)
        }
    }
    
}//
