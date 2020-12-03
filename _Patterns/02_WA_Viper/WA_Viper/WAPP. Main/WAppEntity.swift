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
    }
    
}//







