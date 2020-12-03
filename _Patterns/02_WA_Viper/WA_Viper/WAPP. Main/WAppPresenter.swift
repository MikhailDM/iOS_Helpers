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
    
    private var serverData: WAppServerData?
    
    
    //MARK: - Present
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .requestDefaultWeather:
            interactor?.interactorRequest(requestType: .requestDefaultWeather)
        }
    }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: WApp.Action.InteractorResponse.ResponseType) {
        switch responseType {
        case .responseDefaultWeather(data: let data):
            serverData = data
            view?.display(displayType: .displayWeather(viewModel: getViewModel()))
        }
    }
    
    
    //MARK: - Private
    private func getViewModel() -> WAppViewModel {
        guard let data = serverData else { return WAppViewModel(conditionImage: UIImage(systemName:"cloud.bolt"), cityNameText: "", temperatureText: "") }
        return WAppViewModel(conditionImage: transformCondition(conditionId: data.weather.first?.id),
                             cityNameText: data.name,
                             temperatureText: transformTemperature(temperature: data.main.temp))
    }
    
    private func transformTemperature(temperature: Double) -> String {
        return String(format: "%.1f", temperature)
    }
    
    private func transformCondition(conditionId: Int?) -> UIImage? {
        guard let idSafe = conditionId else { return nil }
        switch idSafe {
        case 200...232:
            return UIImage(systemName:"cloud.bolt")
        case 300...321:
            return UIImage(systemName:"cloud.drizzle")
        case 500...531:
            return UIImage(systemName:"cloud.rain")
        case 600...622:
            return UIImage(systemName:"cloud.snow")
        case 701...781:
            return UIImage(systemName:"cloud.fog")
        case 800:
            return UIImage(systemName:"sun.max")
        case 801...804:
            return UIImage(systemName:"cloud.bolt")
        default:
            return UIImage(systemName:"cloud")
        }
    }
    
}//
