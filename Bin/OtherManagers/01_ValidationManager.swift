//
//  MedValidationManager.swift
//  ekpv2
//
//  Created by Dmitriev on 06.10.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit


struct MedValidationManager {
    //MARK: - Open correct phone number in call app
    func dialValidPhoneNumber(unformattedNumber: String?) {
        guard let unformattedNumberSafe = unformattedNumber else { return }
        
        let inputArrayOfStrings = unformattedNumberSafe.map { String($0) }
        var result = inputArrayOfStrings
            .compactMap { Int($0) }
            .compactMap { String($0) }
            .joined()
        
        if inputArrayOfStrings.first == "+" {
            result = "+" + result
        }
        
        guard let phoneNumber = URL(string: "tel://" + result) else { return }
        UIApplication.shared.open(phoneNumber)
    }
    
    
    //MARK: - Open correct email adress in email app
    func openEmailAppWithAdress(email: String?) {
        guard
            let emailSafe = email,
            let emailSafeURL = URL(string: "mailto:" + emailSafe) else { return }
        UIApplication.shared.open(emailSafeURL)
    }
    
}//
