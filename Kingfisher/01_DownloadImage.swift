//
//  VolKingfisherManager.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 26.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

class VolKingfisherManager {
    //MARK: - Download Image By ID
    
    func downloadImage(imageView: UIImageView, imageId: String) {
        let url = InetConstants.getEventImage()
        
        let imagePlaceholder = UIImage(named: "ic_volunteer_placeholder")
        imageView.kf.setImage(with: URL(string: url + imageId), placeholder: imagePlaceholder, options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.4)),
            .cacheOriginalImage
        ])
    }
    
    
}//Class End
