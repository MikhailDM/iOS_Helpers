//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

class UITVCustomCellsInfoTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var switchStateLabel: UILabel!
    @IBOutlet weak var enteredTextLabel: UILabel!
    @IBOutlet weak var validationLabel: UILabel!
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    
    //MARK: - Configure
    
    func configure(viewModel: UITVCustomCellsViewModel?) {
        guard let viewModelSafe = viewModel else { return }
        switchStateLabel.text = viewModelSafe.switchStateString
        enteredTextLabel.text = viewModelSafe.enteredTextString
        validationLabel.text = viewModelSafe.validState
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() {}
    
    
}//
