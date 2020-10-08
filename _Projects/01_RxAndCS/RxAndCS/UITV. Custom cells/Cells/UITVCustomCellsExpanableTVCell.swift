//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

class UITVCustomCellsExpanableTVCell: UITableViewCell {
    //MARK: - Outlets
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    
    //MARK: - Configure
    
    func configure() { }
    
    
    //MARK: - Private
    
    private func setupDesign() {
        separatorInset.left = .greatestFiniteMagnitude
    }
    
    
}//
