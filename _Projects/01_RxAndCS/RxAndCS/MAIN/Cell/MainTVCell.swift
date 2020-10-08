//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

class MainTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    
    //MARK: - Configure
    
    func configure(cellViewModel: MainViewModel.Section.Cell?) {
        guard let cellViewModelSafe = cellViewModel else { return }
        titleLabel.text = cellViewModelSafe.title
        descriptionLabel.text = cellViewModelSafe.description
    }
    
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    
    
}//
