//
//  WAppSearchPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


class WAppSearchPresenter: WAppSearchPresenterProtocol, WAppSearchPresenterLogicProtocol, WAppSearchOutputInteractorProtocol, WAppSearchDataStoreProtocol {
    //MARK: - Properties
    var view: WAppSearchViewLogicProtocol?
    var router: WAppSearchRouterLogicProtocol?
    var interactor: WAppSearchInputInteractorLogicProtocol?
    var dataStore: WAppSearch.DataStore?
    
    private var citiesList = CitiesManager().getAllCitiesName()
    
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .getCitiesList:
            view?.display(displayType: .displayCities(cities: citiesList))
            
        case .selectCity(city: let city):
            dataStore?.selectedCity.onNext(city)
            dataStore?.selectedCity.onCompleted()
            
        case .getCitiesWhichContainText(searchText: let searchText):
            guard searchText != "" else {
                view?.display(displayType: .displayCities(cities: citiesList))
                return
            }
            let searchData = citiesList.filter { city -> Bool in
                return city.lowercased().contains(searchText.lowercased())
            }
            view?.display(displayType: .displayCities(cities: searchData))
        }
    }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: WAppSearch.Action.InteractorResponse.ResponseType) { }
    
    
    //MARK: - Private
}//
