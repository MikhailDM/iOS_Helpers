//
//  WAppEntity.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//

import UIKit


class WAppEntity {
    //MARK: - View Model
    struct ViewModel {
        let conditionImage: UIImage?
        let cityNameText: String
        let temperatureText: String
    }
    
    
    //MARK: - Server Data
    struct ServerData: Codable {
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
        
        var transformedTemperature: String {
            return String(format: "%.1f", main.temp)
        }
        
        var transformedCondition: UIImage? {
            guard let idSafe = weather.last?.id else { return nil }
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
    }
    
}//







