//
//  CitiesManager.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
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
    ]
    
    
    //MARK: - Get Cities
    func getAllCitiesName() -> [String] {
        return citiesList.sorted { $0 < $1 }
    }
    
    
//    private var completer: MKLocalSearchCompleter = MKLocalSearchCompleter()
//    public var searchedCities = PublishSubject<[MKLocalSearchCompletion]>()
    
    
    //MARK: - Init
//    override init() {
//        super.init()
//        completer.delegate = self
//        completer.region = MKCoordinateRegion(.world)
//        completer.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
//    }
    
    
    //MARK: - Get Cities
//    func getCitiesAfterSearch(searchText: String) {
//        guard searchText != "" else { searchedCities.onNext([]); return }
//        completer.queryFragment = searchText
//    }
//
//    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
//        let results = completer.results.filter { result in
//            guard result.title.contains(",") || !result.subtitle.isEmpty,
//                  !result.subtitle.contains("Nearby") else { return false }
//            return true
//        }
//        searchedCities.onNext(results)
//    }
//
//    func getAllCitiesName() {
//
//    }
    
}//

/*
 if let path = Bundle.main.path(forResource: "test", ofType: "json") {
     do {
           let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
           let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
           if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                     // do stuff
           }
       } catch {
            // handle error
       }
 }
 */
