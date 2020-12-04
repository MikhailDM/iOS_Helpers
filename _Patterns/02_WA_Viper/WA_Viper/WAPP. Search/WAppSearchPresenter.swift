//
//  WAppSearchPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


class WAppSearchPresenter: WAppSearchPresenterProtocol, WAppSearchOutputInteractorProtocol, WAppSearchDataStoreProtocol {
    //MARK: - Properties
    var view: WAppSearchViewProtocol?
    var router: WAppSearchRouterProtocol?
    var interactor: WAppSearchInputInteractorProtocol?
    var dataStore: WAppSearch.DataStore?
    
    private var citiesList = CitiesManager().getAllCitiesName()
    
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .getCitiesList:
            view?.display(displayType: .displayCities(cities: citiesList))
        }
    }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: WAppSearch.Action.InteractorResponse.ResponseType) { }
    
    
    //MARK: - Private
}//
