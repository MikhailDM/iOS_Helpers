//
//  WAppPresenter.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//

import UIKit

class WAppPresenter: WAppPresenterProtocol, WAppPresenterLogicProtocol {
    
    //MARK: - Properties
    weak var view: WAppViewLogicProtocol?
    
    //MARK: - Services
    
    //MARK: - Present
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .presentWeather(data: let data):
            let vm = WAppEntity.ViewModel(conditionImage: transformCondition(conditionId: data.weather.first?.id),
                                   cityNameText: data.name,
                                   temperatureText: transformTemperature(temperature: data.main.temp))
            view?.display(displayType: .displayWeather(viewModel: vm))
        }
    }
    
    //MARK: - Private
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
