//
//  VolLoadScreenManager.swift
//  ekpv2
//
//  Created by Dmitriev on 02.09.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

struct VolLoadScreenManager {
    
    func showLoadingScreen(view: UIView) {
        UIUtils.showLoading(view: view)
    }
    
    func endShowLoadingScreen() {
        UIUtils.endLoading()
    }
    
    
}//Class end
