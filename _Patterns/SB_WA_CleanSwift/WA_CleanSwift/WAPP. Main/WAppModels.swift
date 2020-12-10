//
//  WAppModels.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020
//


import UIKit

enum WApp {
    //MARK: - Models
    enum Model {
        struct Request {
            enum RequestType {
                case requestDefaultWeather
                case requestWeatherByCity(cityName: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentWeather(data: WAppServerData)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayWeather(viewModel: WAppViewModel)
            }
        }
    }
    
}//


//MARK: - View Model
struct WAppViewModel {
    let conditionImage: UIImage?
    let cityNameText: String
    let temperatureText: String
}


//MARK: - Server Data
struct WAppServerData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let description: String
        let id: Int
    }
}


