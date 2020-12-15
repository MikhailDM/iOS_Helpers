//
//  NetworkManager.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

struct NetworkManager {
    
    //MARK: - Properties
    private let disposeBag = DisposeBag()
    private let session = SessionManager()
    
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=679151602cd4548fb4e552931568fa89&units=metric"
    private let defaultCity = "Saint+Petersburg"
    
    //MARK: - Request type
    enum RequestType {
        case defaultWeather
        case weatherByCityName(cityName: String)
    }
    
    //MARK: - Public request
    func fetchWeather(requestType: RequestType) -> Observable<WAppEntity.ServerData> {
        let requestURL = getCorrectURL(requestType: requestType)
        return session.rx
            .data(.get, requestURL)
            .map { data -> WAppEntity.ServerData in
                return try JSONDecoder().decode(WAppEntity.ServerData.self, from: data)
            }
    }

    //MARK: - Private
    private func getCorrectURL(requestType: RequestType) -> String {
        switch requestType {
        case .defaultWeather:
            return "\(weatherURL)&q=\(defaultCity)"
        case .weatherByCityName(cityName: let cityName):
            return "\(weatherURL)&q=\(cityName.split(separator: " ").joined(separator: "+"))"
        }
    }    
    
}//


