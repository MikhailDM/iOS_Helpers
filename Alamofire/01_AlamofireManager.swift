//
//  VolNetworkingManager.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 25.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import Foundation
import Alamofire

class VolNetworkingManager {
    //MARK: - Managers
    
    private let alamofireManager = InetUtils.getAlamoFire()
    private let dateFormatter = VolDates()
    
    
    //MARK: - Events IDs

    func requestAllEventsID(filterSettings: VolFilterData, completion: @escaping (_ result: [Int]?) -> ()) {
        let url = InetConstants.getFindEvents()
        
        let parameters: [String: Any] = getParameters(filterSettings: filterSettings)
        
        alamofireManager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                guard
                    let responseSafe = JSON as? NSDictionary,
                    let idsList = responseSafe.object(forKey: "eventsIds") as? [Int] else {
                        print("SERVER. GET IDs - JSON ERROR")
                        completion(nil)
                        return
                }
                //print("SERVER. GET IDs - \(idsList)")
                print("SERVER. GET IDs - SUCCESS")
                completion(idsList.sorted(by: { $0 < $1 }))
            case .failure(let error):
                print("SERVER. GET IDs - REQUEST ERROR: \(error)")
                completion(nil)
            }
        }
    }
    
    private func getParameters(filterSettings: VolFilterData) -> [String : Any] {
        var parameters: [String: Any] = [:]
        
        if let dateBeginSafe = filterSettings.dateBeginAsDate {
            parameters["dateBegin"] = dateFormatter.dateWithDash(from: dateBeginSafe)
        }
        if let dateEndSafe = filterSettings.dateEndAsDate {
            parameters["dateEnd"] = dateFormatter.dateWithDash(from: dateEndSafe)
        }
        if let favoriteSafe = filterSettings.favorite {
            parameters["favorite"] = favoriteSafe
        }
        if let searchSafe = filterSettings.search {
            parameters["search"] = searchSafe
        }
        if let ageBeginSafe = filterSettings.ageBegin {
            parameters["ageBegin"] = ageBeginSafe
        }
        if let ageEndSafe = filterSettings.ageEnd {
            parameters["ageEnd"] = ageEndSafe
        }
        if let genderSafe = filterSettings.gender {
            parameters["gender"] = genderSafe
        }
        
        return parameters
    }
    
    
    //MARK: - Events Description
    
    func requestAllEventsDescription(eventsIDs: [Int], completion: @escaping (_ result: VolEventsData?) -> ()) {
        let url = InetConstants.getEventDescription()
        
        let parameters: [String: Any] = [
            "full": true,
            "eventIds": eventsIDs
        ]
        
        alamofireManager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let descriptions = try JSONDecoder().decode(VolEventsData.self, from: data)
                    //print("SERVER. GET DESCRIPTIONS - \(descriptions)")
                    print("SERVER. GET DESCRIPTIONS - SUCCESS")
                    completion(descriptions)
                } catch let error {
                    print("SERVER. GET DESCRIPTIONS - PARSE DATA ERROR: \(error)")
                }
            case .failure(let error):
                print("SERVER. GET DESCRIPTIONS - REQUEST ERROR: \(error)")
                completion(nil)
            }
        }
    }
    
    
    //MARK: - Star Event
    
    func requestStarEvent(eventsID: Int, isAdd: Bool, completion: @escaping (_ result: Bool) -> ()) {
        let url = InetConstants.getStarEvent(eventsID: eventsID, isAdd: isAdd)
        
        let parameters: [String: Any] = [
            "eventId": eventsID,
            "add": isAdd
        ]
        
        alamofireManager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                guard
                    let responseSafe = JSON as? NSDictionary,
                    let code = responseSafe.object(forKey: "faultCode") as? Int,
                    let message = responseSafe.object(forKey: "faultString") as? String else {
                        print("SERVER. STAR EVENT - JSON ERROR")
                        completion(false)
                        return
                }
                if code == 200 {
                    print("SERVER. STAR EVENT - SUCCESS")
                    completion(true)
                } else {
                    print("SERVER. STAR EVENT MESSAGE - \(message). CODE - \(code)")
                    completion(false)
                }
                
            case .failure(let error):
                print("SERVER. STAR EVENT - REQUEST ERROR: \(error)")
                completion(false)
            }
        }
    }
    
    
}//Class End
