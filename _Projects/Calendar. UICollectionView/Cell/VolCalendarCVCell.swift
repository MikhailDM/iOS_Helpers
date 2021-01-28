//
//  AfishaCalendarDayCollectionViewCell.swift
//  ekpv2
//
//  Created by Вячеслав Яшунин on 19.05.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

class VolCalendarCVCell: UICollectionViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var numberDayLabel: UILabel!
    @IBOutlet weak var pickedDayImageView: UIImageView!
    
    
    //MARK: - Configure
    
    func configureCell(cellVM: VolCalendarCell) {
        numberDayLabel.text = cellVM.dateString
        numberDayLabel.textColor = cellVM.fontColor
        pickedDayImageView.image = cellVM.bgImage
    }
}
