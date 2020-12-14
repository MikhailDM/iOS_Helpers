//
//  WAppInteractor.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//


import UIKit
import RxSwift


class WAppInteractor: WAppInteractorProtocol, WAppInteractorLogicProtocol, WAppDataStoreProtocol {
    //MARK: - Properties
    var presenter: WAppPresenterLogicProtocol?
    var router: WAppRouterLogicProtocol?
    var dataStore: WApp.DataStore?
    
    private var serverData: WAppEntity.ServerData?
    
    
    //MARK: - Services
    private let networkManager = NetworkManager()
    private let disposeBag = DisposeBag()
    
    
    //MARK: - Request
    func interactorRequest(requestType: WApp.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .requestDefaultWeather:
            networkManager
                .fetchWeather(requestType: .defaultWeather)
                .subscribe { [weak self] data in
                    guard let self = self else { return }
                    self.serverData = data
                    self.goToPresenter()
                }
                onError: { (error) in
                    print("===== FETCH WEATHER ERROR: \(error)")
                }
                .disposed(by: disposeBag)
            
        case .requestWeatherByCity(cityName: let cityName):
            networkManager
                .fetchWeather(requestType: .weatherByCityName(cityName: cityName))
                .subscribe { [weak self] data in
                    guard let self = self else { return }
                    self.serverData = data
                    self.goToPresenter()
                }
                onError: { (error) in
                    print("==== FETCH WEATHER ERROR: \(error)")
                }
                .disposed(by: disposeBag)
        
        case .searchButtonPressed:
            router?.routeTo(routeType: .routeToSearch)
        }
    }
    
    
    //MARK: - Private
    private func goToPresenter() {
        guard let serverDataSafe = serverData else { return }
        presenter?.presenterRequest(requestType: .presentWeather(data: serverDataSafe))
    }
}//
