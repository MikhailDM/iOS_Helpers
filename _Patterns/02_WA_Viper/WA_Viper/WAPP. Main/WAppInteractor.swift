//
//  WAppInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift


//MARK: - Protocol. BusinessLogic
protocol WAppBusinessLogic {
    func makeRequest(request: WApp.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore
protocol WAppDataStore {
    var dataStore: WAppServerData? { get set }
    var cityName: String? { get set }
}


class WAppInteractor: WAppBusinessLogic, WAppDataStore {
    //MARK: - Properties
    var presenter: WAppPresentationLogic?
    var service: WAppWorker?
    
    var dataStore: WAppServerData?
    var cityName: String?
    
    
    //MARK: - Managers/Helpers
    private let networkManager = NetworkManager()
    private let disposeBag = DisposeBag()
    
    
    //MARK: - Requests
    func makeRequest(request: WApp.Model.Request.RequestType) {
        if service == nil {
            service = WAppWorker()
        }
        
        switch request {
        case .requestDefaultWeather:
            networkManager
                .fetchWeather(requestType: .defaultWeather)
                .subscribe { [weak self] data in
                    guard let self = self else { return }
                    self.dataStore = data
                    self.goToPresenter()
                }
                onError: { (error) in
                    print("FETCH WEATHER ERROR: \(error)")
                }
                .disposed(by: disposeBag)
            
        case .requestWeatherByCity(cityName: let cityName):
            networkManager
                .fetchWeather(requestType: .weatherByCityName(cityName: cityName))
                .subscribe { [weak self] data in
                    guard let self = self else { return }
                    self.dataStore = data
                    self.goToPresenter()
                }
                onError: { (error) in
                    print("FETCH WEATHER ERROR: \(error)")
                }
                .disposed(by: disposeBag)
        }
    }
    
    
    //MARK: - Private
    
    private func goToPresenter() {
        guard let dataStoreSafe = dataStore else { return }
        presenter?.presentData(response: .presentWeather(data: dataStoreSafe))
    }
    
}//
