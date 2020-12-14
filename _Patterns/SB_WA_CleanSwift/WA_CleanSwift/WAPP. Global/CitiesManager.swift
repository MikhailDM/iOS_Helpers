//
//  CitiesManager.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//


import Foundation
import MapKit
import RxSwift


//MARK: - Model of City
struct City {
    var ru: String
    var en: String
}


class CitiesManager: NSObject, MKLocalSearchCompleterDelegate {
    //MARK: - Properties
    private let citiesList = [
        "London",
        "Berlin",
        "Paris",
        "Moscow",
        "Saint Petersburg",
        "New York",
        "Dubai",
        "Tokio",
        "Sochi",
    ]
    
    
    //MARK: - Get Cities
    func getAllCitiesName() -> [String] {
        return citiesList.sorted { $0 < $1 }
    }
}//

