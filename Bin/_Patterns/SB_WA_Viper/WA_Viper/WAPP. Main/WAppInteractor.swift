//
//  WAppInteractor.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//

import UIKit
import RxSwift

class WAppInteractor: WAppInputInteractorProtocol, WAppInputInteractorLogicProtocol  {
    
    //MARK: - Properties
    weak var presenter: WAppOutputInteractorProtocol?
    
    //MARK: - Services
    private let networkManager = NetworkManager()
    private let disposeBag = DisposeBag()
    
    //MARK: - Request
    func interactorRequest(requestType: WApp.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .requestDefaultWeather:
            networkManager
                .fetchWeather(requestType: .defaultWeather)
                .subscribe(
                    onNext: { [weak self] data in
                        self?.presenter?.interactorResponse(responseType: .responseWeatherByCity(data: data))
                    },
                    onError: { error in print("===== FETCH WEATHER ERROR: \(error)") })
                .disposed(by: disposeBag)
            
        case .requestWeatherByCity(cityName: let cityName):
            networkManager
                .fetchWeather(requestType: .weatherByCityName(cityName: cityName))
                .subscribe(
                    onNext: { [weak self] data in
                        self?.presenter?.interactorResponse(responseType: .responseWeatherByCity(data: data))
                    },
                    onError: { error in print("===== FETCH WEATHER ERROR: \(error)") })
                .disposed(by: disposeBag)
        }
    }
    
}//
