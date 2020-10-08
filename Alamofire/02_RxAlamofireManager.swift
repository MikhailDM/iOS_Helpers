//
//  MedNetworkManager.swift
//  ekpv2
//
//  Created by Dmitriev on 08.09.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import Alamofire
import RxAlamofire
import RxSwift


struct MedNetworkManager {
    //MARK: - Managers
    private let alamofireManager = InetUtils.getAlamoFire()
    
    
    //MARK: - Check if OMS is incorrect
    func requestOMSisCorrect() -> Observable<Bool> {
        let url = InetConstants.getMedOMSNumber()
        return alamofireManager.rx
            .request(.post, url, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON()
            .map { response -> Bool in
                return (response.result.value as? NSDictionary)?.object(forKey: "faultCode") != nil ? false : true
            }
    }
    
    
    //MARK: - Check if OMS linked to hospital
    func requestIsOMSLinkedToHospital() -> Observable<Bool> {
        let url = InetConstants.getMedPoliclinics()
        return alamofireManager.rx
            .request(.post, url, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON()
            .map { response -> Bool in
                return ((response.result.value as? NSDictionary)?.object(forKey: "result") as? String) != nil ? false : true
            }
    }
    
    
    //MARK: - Request list of linked hospitals
    func requestListOfLinkedHospitals() -> Observable<MedPoliclinicsServerData> {
        let url = InetConstants.getMedPoliclinics()
        return alamofireManager.rx
            .request(.post, url, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData()
            .map { response -> MedPoliclinicsServerData in
                return try JSONDecoder().decode(MedPoliclinicsServerData.self, from: response.1)
            }
    }
    
    
    //MARK: - Requests appointments
    func requestUserAppointments() -> Observable<MedAppointServerData> {
        let url = InetConstants.getMedAppointments()
        let parameters: [String: Any] = [
            "lpu": [0],
            "actualOnly": true
        ]
        return alamofireManager.rx
            .request(.post, url, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseData()
            .map { response -> MedAppointServerData in
                return try JSONDecoder().decode(MedAppointServerData.self, from: response.1)
            }
    }
    
    
    //MARK: - Request OMS incorrect number
    private struct RequestOMSIncorrectNumberModel: Codable {
        let omsNumber: String
    }
    
    func requestOMSIncorrectNumber() -> Observable<String> {
        let url = InetConstants.getMedOMSNumber()
        return alamofireManager.rx
            .request(.post, url, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData()
            .map { response -> String in
                return try JSONDecoder().decode(RequestOMSIncorrectNumberModel.self, from: response.1).omsNumber
            }
    }
    
    
    //MARK: - Save correct OMS number
    private struct SaveRealNumberOMSModel: Codable {
        let message: String
    }
    
    func saveRealNumberOMS(series: String, number: String) -> Observable<Bool> {
        //Преобразуем ссылку с кирилицей
        let url = InetConstants.saveMedOMSNumber(series: series, number: number)
            .addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
       
        return alamofireManager.rx
            .request(.post, url, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData()
            .map { response -> Bool in
                let _ = try JSONDecoder().decode(SaveRealNumberOMSModel.self, from: response.1).message
                return true
            }
    }
    
}//
