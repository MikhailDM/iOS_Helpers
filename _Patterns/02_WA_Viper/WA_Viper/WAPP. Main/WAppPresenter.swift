//
//  WAppPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppPresenter: WAppPresenterProtocol, WAppOutputInteractorProtocol, WAppDataStoreProtocol {
    //MARK: - Properties
    var view: WAppViewProtocol?
    var router: WAppRouterProtocol?
    var interactor: WAppInputInteractorProtocol?
    var dataStore: WApp.DataStore?
    
    private var serverData: WAppEntity.ServerData?
    
    
    //MARK: - Present
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .requestDefaultWeather:
            interactor?.interactorRequest(requestType: .requestDefaultWeather)
            
        case .updateCity(city: let city):
            interactor?.interactorRequest(requestType: .requestWeatherByCity(cityName: city))
        }
    }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: WApp.Action.InteractorResponse.ResponseType) {
        switch responseType {
        case .responseWeatherByCity(data: let data):
            serverData = data
            view?.display(displayType: .displayWeather(viewModel: getViewModel()))
        }
    }
    
    
    //MARK: - Private
    private func getViewModel() -> WAppEntity.ViewModel {
        guard let data = serverData else { return WAppEntity.ViewModel(conditionImage: UIImage(systemName:"cloud.bolt"), cityNameText: "", temperatureText: "") }
        return WAppEntity.ViewModel(conditionImage: data.transformedCondition,
                                    cityNameText: data.name,
                                    temperatureText: data.transformedTemperature)
    }
    
}//
